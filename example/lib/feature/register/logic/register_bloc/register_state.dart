part of 'register_bloc.dart';

@freezed
class RegisterState with _$RegisterState {
  const RegisterState._();
  const factory RegisterState({
    // @Default(SubmissionStatus<void>.idle())
    // SubmissionStatus<void> submissionStatus,
    // @Default(EmailInput.pure()) EmailInput email,
    required FormModel<String> password,
    required FormModel<String> confirmPassword,
    // @Default(PracticeListInput.pure()) PracticeListInput practices,
  }) = _RegisterState;

  // String getPassword() => state.password.value;
}
