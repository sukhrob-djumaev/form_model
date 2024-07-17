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
    on<_SetPasswordRegisterEvent>(_setPassword);
    // on<_SetPracticesRegistrationAboutEvent>(_setPractices);
    // on<_SubmitRegistrationAboutEvent>(_submit);
    // on<_SkipAboutInfoRegistrationAboutEvent>(_skipAboutInfo);
  }

  void _setPassword(
      _SetPasswordRegisterEvent event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(
        password: state.password.setValue(event.value),
      ),
    );
  }
}
