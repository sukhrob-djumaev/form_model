import 'dart:async';

import 'package:example/feature/register/source/user_repository.dart';
import 'package:example/shared/logic/bloc/transformers.dart';
import 'package:example/shared/model/exception/app_exception.dart';
import 'package:example/shared/model/form/form_input.dart';
import 'package:example/shared/model/form/validator/confirm_password_validator.dart';
import 'package:example/shared/model/form/validator/required_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_model/form_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final IUserRepository _repository;

  RegisterBloc({
    required IUserRepository repository,
  })  : _repository = repository,
        super(
          const RegisterState(
            name: NullableFormInput(
              status: FormModelStatus.loading(),
              validators: [
                RequiredValidator(),
              ],
            ),
            username: FormInput('', validators: [
              RequiredValidator(),
            ]),
            password: FormInput('', validators: [
              RequiredValidator(),
            ]),
            confirmPassword: FormInput(
              '',
              validators: [
                RequiredValidator(),
                ConfirmPasswordValidator(),
              ],
            ),
          ),
        ) {
    on<_InitRegisterEvent>(_init);
    on<_SetNameRegisterEvent>(_setName);
    on<_SetUsernameRegisterEvent>(
      _setUsername,
      transformer: AppTransformers.restartableWithDebounce(),
    );
    on<_SetPasswordRegisterEvent>(_setPassword);
    on<_SetConfirmPasswordRegisterEvent>(_setConfirmPassword);
    on<_SubmitRegisterEvent>(
      _submit,
      transformer: AppTransformers.droppable1(),
    );
  }

  Future<void> _init(
      _InitRegisterEvent event, Emitter<RegisterState> emit) async {
    emit(
      state.copyWith(
        confirmPassword: state.confirmPassword.replaceValidator(
          (validator) => validator is ConfirmPasswordValidator,
          newValidator: ConfirmPasswordValidator(
            valueGetter: () => state.password.value,
          ),
        ),
      ),
    );

    await Future.delayed(const Duration(seconds: 3));

    emit(
      state.copyWith(
        name: state.name.reset(value: () => 'User1'),
      ),
    );
  }

  Future<void> _setName(
      _SetNameRegisterEvent event, Emitter<RegisterState> emit) async {
    emit(
      state.copyWith(
        name: state.name.setValue(event.value),
      ),
    );
  }

  Future<void> _setUsername(
      _SetUsernameRegisterEvent event, Emitter<RegisterState> emit) async {
    emit(
      state.copyWith(
        username: state.username
            .setValue(event.value, status: const FormModelStatus.editing()),
      ),
    );

    try {
      await _repository.isUsernameTaken(event.value);

      emit(
        state.copyWith(
          username: state.username.setValue(event.value),
        ),
      );
    } on BadResponseException catch (e) {
      emit(
        state.copyWith(
          username: state.username.dirty(error: e.toString()),
        ),
      );
    } on Exception catch (e, st) {
      emit(
        state.copyWith(
          username: state.username.dirty(error: e.toString()),
        ),
      );

      onError(e, st);
    }
  }

  void _setPassword(
      _SetPasswordRegisterEvent event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(
        password: state.password.setValue(event.value),
        confirmPassword: state.confirmPassword.reset(
          status: const FormModelStatus.edited(),
        ),
      ),
    );
  }

  void _setConfirmPassword(
      _SetConfirmPasswordRegisterEvent event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(
        confirmPassword: state.confirmPassword.setValue(event.value),
      ),
    );
  }

  Future<void> _submit(
      _SubmitRegisterEvent event, Emitter<RegisterState> emit) async {
    final dirtyForm = state.dirtyForm();

    if (dirtyForm == null) return;

    emit(
      dirtyForm,
    );

    if (!state.isFormValid) {
      return;
    }

    try {
      await _repository.register(
        username: state.username.value,
        password: state.password.value,
      );
    } on BadResponseException catch (e) {
      emit(
        state.copyWith(
          username: state.username.dirty(error: e.fieldError('username')),
        ),
      );
    } on Exception catch (e, st) {
      emit(
        state.copyWith(
          username: state.username.dirty(error: e.toString()),
        ),
      );

      onError(e, st);
    }
  }
}
