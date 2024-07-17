part of 'register_bloc.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  // const factory RegistrationAboutEvent.setEmail(String value) =
  //     _SetEmailRegistrationAboutEvent;

  const factory RegisterEvent.init() = _InitRegisterEvent;

  const factory RegisterEvent.setPassword(String value) =
      _SetPasswordRegisterEvent;

  const factory RegisterEvent.setConfirmPassword(String value) =
      _SetConfirmPasswordRegisterEvent;
}
