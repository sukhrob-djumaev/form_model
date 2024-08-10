import 'package:form_model/form_model.dart';

class PredefinedFormErrorKeyTranslationsDe implements PredefinedFormErrorKeyTranslations {
  @override
  String translate(PredefinedFormErrorKey errorKey) {
    return switch (errorKey.type) {
      PredefinedFormErrorType.required => 'Dieses Feld ist erforderlich.',
      PredefinedFormErrorType.lengthIsLessThanMin => 'Die Länge muss mindestens ${errorKey.parameter} betragen.',
      PredefinedFormErrorType.lengthIsMoreThanMax => 'Die Länge darf höchstens ${errorKey.parameter} betragen.',
      PredefinedFormErrorType.lengthIsNotEqual => 'Die Länge muss genau ${errorKey.parameter} betragen.',
      PredefinedFormErrorType.didNotMatchPattern =>
        'Der Wert entspricht nicht dem erwarteten Muster: ${errorKey.parameter}.',
      PredefinedFormErrorType.isNotOnlyText => 'Dieses Feld darf nur alphabetische Zeichen enthalten.',
      PredefinedFormErrorType.isNotOnlyNumbers => 'Dieses Feld darf nur Zahlen enthalten.',
      PredefinedFormErrorType.isNotValidEmail => 'Dieses Feld erfordert eine gültige E-Mail-Adresse.',
      PredefinedFormErrorType.isNotValidPhoneNumber => 'Dieses Feld erfordert eine gültige Telefonnummer.',
      PredefinedFormErrorType.isNotValidDateTime =>
        'Dieses Feld erfordert ein gültiges Datum und eine gültige Uhrzeit.',
      PredefinedFormErrorType.dateIsLessThanMinAge => 'Der Wert muss mindestens ${errorKey.parameter} betragen.',
      PredefinedFormErrorType.dateIsMoreThanMaxAge => 'Der Wert darf höchstens ${errorKey.parameter} betragen.',
      PredefinedFormErrorType.numIsLessThanMin => 'Der Wert muss mindestens ${errorKey.parameter} betragen.',
      PredefinedFormErrorType.numIsMoreThanMax => 'Der Wert darf höchstens ${errorKey.parameter} betragen.',
      PredefinedFormErrorType.boolShouldBeTrue => 'Dieser Wert muss wahr sein.',
      PredefinedFormErrorType.boolShouldBeFalse => 'Dieser Wert muss falsch sein.',
      PredefinedFormErrorType.boolAgreeToTerms => 'Sie müssen den Geschäftsbedingungen zustimmen.',
      PredefinedFormErrorType.intIsNotValidCreditCard => 'Dies ist keine gültige Kreditkartennummer.',
      PredefinedFormErrorType.wordCountIsLessThan => 'Die Wortanzahl muss mindestens ${errorKey.parameter} betragen.',
      PredefinedFormErrorType.wordCountIsMoreThan => 'Die Wortanzahl darf höchstens ${errorKey.parameter} betragen.',
      PredefinedFormErrorType.isNotValidIpAddress => 'Dieses Feld erfordert eine gültige IP-Adresse.',
      PredefinedFormErrorType.isNotValidIpv6Address => 'Dieses Feld erfordert eine gültige IPv6-Adresse.',
      PredefinedFormErrorType.isNotValidUrl => 'Dieses Feld erfordert eine gültige URL.',
      PredefinedFormErrorType.isNotEqualTo => 'Der Wert muss gleich ${errorKey.parameter} sein.',
      PredefinedFormErrorType.passwordsDoNotMatch => 'Die Passwörter stimmen nicht überein.',
      PredefinedFormErrorType.passwordTooShort =>
        'Das Passwort muss mindestens ${errorKey.parameter} Zeichen lang sein.',
      PredefinedFormErrorType.passwordNoUppercase => 'Das Passwort muss mindestens einen Großbuchstaben enthalten.',
      PredefinedFormErrorType.passwordNoLowercase => 'Das Passwort muss mindestens einen Kleinbuchstaben enthalten.',
      PredefinedFormErrorType.passwordNoNumber => 'Das Passwort muss mindestens eine Zahl enthalten.',
      PredefinedFormErrorType.passwordNoSpecialChar =>
        'Das Passwort muss mindestens ein Sonderzeichen enthalten (${errorKey.parameter}).',
      PredefinedFormErrorType.stringDoesNotContain => 'Der Text muss "${errorKey.parameter}" enthalten.',
      PredefinedFormErrorType.stringContains => 'Der Text darf "${errorKey.parameter}" nicht enthalten.',
      PredefinedFormErrorType.invalidFileType => errorKey.parameter is List
          ? 'Ungültiger Dateityp. Erlaubte Typen sind: ${(errorKey.parameter as List<String>).join(", ")}.'
          : 'Ungültiger Dateityp.',
      PredefinedFormErrorType.fileSizeExceedsLimit =>
        'Die Dateigröße überschreitet das maximale Limit${_formatFileSize(errorKey.parameter)}.',
    };
  }

  String _formatFileSize(dynamic sizeInBytes) {
    if (sizeInBytes is int) {
      if (sizeInBytes < 1024) return '$sizeInBytes B';
      if (sizeInBytes < 1048576) return '${(sizeInBytes / 1024).toStringAsFixed(2)} KB';
      return ' von ${(sizeInBytes / 1048576).toStringAsFixed(2)} MB';
    }
    return '';
  }
}
