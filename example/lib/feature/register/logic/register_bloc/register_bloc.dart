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
            password: const FormModel<String>(''),
            confirmPassword: FormModel<String>(
              '',
              validators: [
                ConfirmPasswordValidator(passwordGetter: () => ''),
              ],
            ),
          ),
        ) {
    on<_InitRegisterEvent>(_init);
    on<_SetPasswordRegisterEvent>(_setPassword);
    on<_SetConfirmPasswordRegisterEvent>(_setConfirmPassword);
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

  void _setPassword(
      _SetPasswordRegisterEvent event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(
        password: state.password.setValue(event.value),
        confirmPassword: state.confirmPassword.dirty(force: false),
      ),
    );
  }

  void _setConfirmPassword(
      _SetConfirmPasswordRegisterEvent event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(
        confirmPassword:
            state.confirmPassword.setValue(event.value, reactive: true),
      ),
    );
  }
}
