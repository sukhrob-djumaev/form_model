part of 'register_bloc.dart';

@freezed
class RegisterState with _$RegisterState, FormMixin {
  const RegisterState._();

  const factory RegisterState({
    required NullableFormInput<String> name,
    required FormInput<String> username,
    required FormInput<String> password,
    required FormInput<String> confirmPassword,
  }) = _RegisterState;

  @override
  List<IFormModel> get formProps => [
        name,
        username,
        password,
        confirmPassword,
      ];

  @override
  RegisterState? dirtyForm() => readyToSubmit
      ? copyWith(
          name: name.dirty(),
          username: username.dirty(),
          password: password.dirty(),
          confirmPassword: confirmPassword.dirty(),
        )
      : null;
}
