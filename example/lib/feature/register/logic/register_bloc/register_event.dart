part of 'register_bloc.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.init() = _InitRegisterEvent;

  const factory RegisterEvent.setUsername(String value) =
      _SetUsernameRegisterEvent;

  const factory RegisterEvent.setPassword(String value) =
      _SetPasswordRegisterEvent;

  const factory RegisterEvent.setConfirmPassword(String value) =
      _SetConfirmPasswordRegisterEvent;

  const factory RegisterEvent.submit() = _SubmitRegisterEvent;
}
