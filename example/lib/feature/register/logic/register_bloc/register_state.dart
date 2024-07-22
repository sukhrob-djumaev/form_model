part of 'register_bloc.dart';

@freezed
class RegisterState with _$RegisterState, FormMixin implements IForm {
  const RegisterState._();
  const factory RegisterState({
    required FormModel<String> username,
    required FormModel<String> password,
    required FormModel<String> confirmPassword,
  }) = _RegisterState;

  @override
  List<IFormModel> get formModels => [
        password,
        confirmPassword,
      ];

  @override
  RegisterState dirtyForm() => copyWith(
        password: password.dirty(),
        confirmPassword: confirmPassword.dirty(),
      );
}
