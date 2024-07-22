import 'dart:async';

import 'package:example/shared/logic/bloc/transformers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_model/form_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc()
      : super(
          RegisterState(
            username: const FormModel('', validators: [
              RequiredValidator(),
            ]),
            password: const FormModel('', validators: [
              RequiredValidator(),
            ]),
            confirmPassword: FormModel(
              '',
              validators: [
                const RequiredValidator(),
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
          (validator) => validator is ConfirmPasswordValidator,
          newValidator: ConfirmPasswordValidator(
            passwordGetter: () => state.password.value,
          ),
        ),
      ),
    );
  }

  void _setUsername(
      _SetUsernameRegisterEvent event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(
        password: state.password.setValue(event.value),
        confirmPassword: state.confirmPassword.reset(
          status: FormModelStatus.edited,
        ),
      ),
    );
  }

  void _setPassword(
      _SetPasswordRegisterEvent event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(
        password: state.password.setValue(event.value),
        confirmPassword: state.confirmPassword.reset(
          status: FormModelStatus.edited,
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
    emit(
      state.dirtyForm(),
    );

    if (!state.isFormValid) {
      return;
    }
  }
}
