import 'package:form_model/form_model.dart';

class PredefinedFormErrorKeyTranslationsPl implements PredefinedFormErrorKeyTranslations {
  @override
  String translate(PredefinedFormErrorKey errorKey) {
    return switch (errorKey.type) {
      PredefinedFormErrorType.required => 'To pole jest wymagane.',
      PredefinedFormErrorType.lengthIsLessThanMin => 'Długość powinna wynosić co najmniej ${errorKey.parameter}.',
      PredefinedFormErrorType.lengthIsMoreThanMax => 'Długość nie powinna przekraczać ${errorKey.parameter}.',
      PredefinedFormErrorType.lengthIsNotEqual => 'Długość powinna wynosić dokładnie ${errorKey.parameter}.',
      PredefinedFormErrorType.didNotMatchPattern => 'Wartość nie pasuje do oczekiwanego wzorca: ${errorKey.parameter}.',
      PredefinedFormErrorType.isNotOnlyText => 'To pole powinno zawierać tylko litery.',
      PredefinedFormErrorType.isNotOnlyNumbers => 'To pole powinno zawierać tylko cyfry.',
      PredefinedFormErrorType.isNotValidEmail => 'To pole wymaga prawidłowego adresu e-mail.',
      PredefinedFormErrorType.isNotValidPhoneNumber => 'To pole wymaga prawidłowego numeru telefonu.',
      PredefinedFormErrorType.isNotValidDateTime => 'To pole wymaga prawidłowej daty i godziny.',
      PredefinedFormErrorType.dateIsLessThanMinAge => 'Wartość powinna być co najmniej ${errorKey.parameter}.',
      PredefinedFormErrorType.dateIsMoreThanMaxAge => 'Wartość nie powinna przekraczać ${errorKey.parameter}.',
      PredefinedFormErrorType.numIsLessThanMin => 'Wartość powinna być co najmniej ${errorKey.parameter}.',
      PredefinedFormErrorType.numIsMoreThanMax => 'Wartość nie powinna przekraczać ${errorKey.parameter}.',
      PredefinedFormErrorType.boolShouldBeTrue => 'Ta wartość powinna być prawdziwa.',
      PredefinedFormErrorType.boolShouldBeFalse => 'Ta wartość powinna być fałszywa.',
      PredefinedFormErrorType.boolAgreeToTerms => 'Musisz zaakceptować warunki i postanowienia.',
      PredefinedFormErrorType.intIsNotValidCreditCard => 'To nie jest prawidłowy numer karty kredytowej.',
      PredefinedFormErrorType.wordCountIsLessThan => 'Liczba słów powinna wynosić co najmniej ${errorKey.parameter}.',
      PredefinedFormErrorType.wordCountIsMoreThan => 'Liczba słów nie powinna przekraczać ${errorKey.parameter}.',
      PredefinedFormErrorType.isNotValidIpAddress => 'To pole wymaga prawidłowego adresu IP.',
      PredefinedFormErrorType.isNotValidIpv6Address => 'To pole wymaga prawidłowego adresu IPv6.',
      PredefinedFormErrorType.isNotValidUrl => 'To pole wymaga prawidłowego adresu URL.',
      PredefinedFormErrorType.isNotEqualTo => 'Wartość powinna być równa ${errorKey.parameter}.',
      PredefinedFormErrorType.passwordsDoNotMatch => 'Hasła nie pasują do siebie.',
      PredefinedFormErrorType.passwordTooShort => 'Hasło powinno mieć co najmniej ${errorKey.parameter} znaków.',
      PredefinedFormErrorType.passwordNoUppercase => 'Hasło powinno zawierać co najmniej jedną wielką literę.',
      PredefinedFormErrorType.passwordNoLowercase => 'Hasło powinno zawierać co najmniej jedną małą literę.',
      PredefinedFormErrorType.passwordNoNumber => 'Hasło powinno zawierać co najmniej jedną cyfrę.',
      PredefinedFormErrorType.passwordNoSpecialChar =>
        'Hasło powinno zawierać co najmniej jeden znak specjalny (${errorKey.parameter}).',
      PredefinedFormErrorType.stringDoesNotContain => 'Wpis powinien zawierać "${errorKey.parameter}".',
      PredefinedFormErrorType.stringContains => 'Wpis nie powinien zawierać "${errorKey.parameter}".',
      PredefinedFormErrorType.invalidFileType => errorKey.parameter is List
          ? 'Nieprawidłowy typ pliku. Dozwolone typy to: ${(errorKey.parameter as List<String>).join(", ")}.'
          : 'Nieprawidłowy typ pliku.',
      PredefinedFormErrorType.fileSizeExceedsLimit =>
        'Rozmiar pliku przekracza maksymalny limit${_formatFileSize(errorKey.parameter)}.',
    };
  }

  String _formatFileSize(dynamic sizeInBytes) {
    if (sizeInBytes is int) {
      if (sizeInBytes < 1024) return ' $sizeInBytes bajtów';
      if (sizeInBytes < 1048576) return ' ${(sizeInBytes / 1024).toStringAsFixed(2)} KB';
      return ' ${(sizeInBytes / 1048576).toStringAsFixed(2)} MB';
    }
    return '';
  }
}
