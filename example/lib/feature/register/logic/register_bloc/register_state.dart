part of 'register_bloc.dart';

@freezed
class RegisterState with _$RegisterState, FormMixin {
  const RegisterState._();
  const factory RegisterState({
    required FormInput<String> username,
    required FormInput<String> password,
    required FormInput<String> confirmPassword,
  }) = _RegisterState;

  @override
  List<IFormModel> get formProps => [
        username,
        password,
        confirmPassword,
      ];

  @override
  RegisterState? dirtyForm() => readyToSubmit
      ? copyWith(
          username: username.dirty(),
          password: password.dirty(),
          confirmPassword: confirmPassword.dirty(),
        )
      : null;
}
