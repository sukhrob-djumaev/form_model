import 'dart:async';

import 'package:example/shared/logic/bloc/transformers.dart';
import 'package:example/shared/model/form/validator/confirm_password_validator.dart';
import 'package:example/shared/model/form/validator/required_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_model/form_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc()
      : super(
          const RegisterState(
            username: FormModel('', validators: [
              RequiredValidator(),
            ]),
            password: FormModel('', validators: [
              RequiredValidator(),
            ]),
            confirmPassword: FormModel(
              '',
              validators: [
                RequiredValidator(),
                ConfirmPasswordValidator(),
              ],
            ),
          ),
        ) {
    on<_InitRegisterEvent>(_init);
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

  void _init(_InitRegisterEvent event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(
        confirmPassword: state.confirmPassword.replaceValidator(
          (validator) => validator is BaseConfirmPasswordValidator,
          newValidator: ConfirmPasswordValidator(
            passwordGetter: () => state.password.value,
          ),
        ),
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
      await Future.delayed(const Duration(seconds: 1));

      if (state.username.value == 'Ermek') {
        throw Exception('User ${event.value} already exist');
      }

      emit(
        state.copyWith(
          username: state.username
              .setValue(event.value, status: const FormModelStatus.edited()),
        ),
      );
    } on Exception catch (e) {
      emit(
        state.copyWith(
          username: state.username.dirty(error: e.toString()),
        ),
      );
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
  }
}
