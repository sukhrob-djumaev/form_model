import 'package:form_model/form_model.dart';

class PredefinedFormErrorKeyTranslationsIt implements PredefinedFormErrorKeyTranslations {
  @override
  String translate(PredefinedFormErrorKey errorKey) {
    return switch (errorKey.type) {
      PredefinedFormErrorType.required => 'Questo campo è obbligatorio.',
      PredefinedFormErrorType.lengthIsLessThanMin => 'La lunghezza deve essere almeno ${errorKey.parameter}.',
      PredefinedFormErrorType.lengthIsMoreThanMax => 'La lunghezza deve essere al massimo ${errorKey.parameter}.',
      PredefinedFormErrorType.lengthIsNotEqual => 'La lunghezza deve essere esattamente ${errorKey.parameter}.',
      PredefinedFormErrorType.didNotMatchPattern =>
        'Il valore non corrisponde al pattern previsto: ${errorKey.parameter}.',
      PredefinedFormErrorType.isNotOnlyText => 'Questo campo deve contenere solo caratteri alfabetici.',
      PredefinedFormErrorType.isNotOnlyNumbers => 'Questo campo deve contenere solo numeri.',
      PredefinedFormErrorType.isNotValidEmail => 'Questo campo richiede un indirizzo email valido.',
      PredefinedFormErrorType.isNotValidPhoneNumber => 'Questo campo richiede un numero di telefono valido.',
      PredefinedFormErrorType.isNotValidDateTime => 'Questo campo richiede una data e un\'ora valide.',
      PredefinedFormErrorType.dateIsLessThanMinAge => 'Il valore deve essere almeno ${errorKey.parameter}.',
      PredefinedFormErrorType.dateIsMoreThanMaxAge => 'Il valore deve essere al massimo ${errorKey.parameter}.',
      PredefinedFormErrorType.numIsLessThanMin => 'Il valore deve essere almeno ${errorKey.parameter}.',
      PredefinedFormErrorType.numIsMoreThanMax => 'Il valore deve essere al massimo ${errorKey.parameter}.',
      PredefinedFormErrorType.boolShouldBeTrue => 'Questo valore deve essere vero.',
      PredefinedFormErrorType.boolShouldBeFalse => 'Questo valore deve essere falso.',
      PredefinedFormErrorType.boolAgreeToTerms => 'Devi accettare i termini e le condizioni.',
      PredefinedFormErrorType.intIsNotValidCreditCard => 'Questo non è un numero di carta di credito valido.',
      PredefinedFormErrorType.wordCountIsLessThan =>
        'Il conteggio delle parole deve essere almeno ${errorKey.parameter}.',
      PredefinedFormErrorType.wordCountIsMoreThan =>
        'Il conteggio delle parole deve essere al massimo ${errorKey.parameter}.',
      PredefinedFormErrorType.isNotValidIpAddress => 'Questo campo richiede un indirizzo IP valido.',
      PredefinedFormErrorType.isNotValidIpv6Address => 'Questo campo richiede un indirizzo IPv6 valido.',
      PredefinedFormErrorType.isNotValidUrl => 'Questo campo richiede un URL valido.',
      PredefinedFormErrorType.isNotEqualTo => 'Il valore deve essere uguale a ${errorKey.parameter}.',
      PredefinedFormErrorType.passwordsDoNotMatch => 'Le password non corrispondono.',
      PredefinedFormErrorType.passwordTooShort =>
        'La password deve essere lunga almeno ${errorKey.parameter} caratteri.',
      PredefinedFormErrorType.passwordNoUppercase => 'La password deve contenere almeno una lettera maiuscola.',
      PredefinedFormErrorType.passwordNoLowercase => 'La password deve contenere almeno una lettera minuscola.',
      PredefinedFormErrorType.passwordNoNumber => 'La password deve contenere almeno un numero.',
      PredefinedFormErrorType.passwordNoSpecialChar =>
        'La password deve contenere almeno un carattere speciale (${errorKey.parameter}).',
      PredefinedFormErrorType.stringDoesNotContain => 'L\'input deve contenere "${errorKey.parameter}".',
      PredefinedFormErrorType.stringContains => 'L\'input non deve contenere "${errorKey.parameter}".',
      PredefinedFormErrorType.invalidFileType => errorKey.parameter is List
          ? 'Tipo di file non valido. I tipi consentiti sono: ${(errorKey.parameter as List<String>).join(", ")}.'
          : 'Tipo di file non valido.',
      PredefinedFormErrorType.fileSizeExceedsLimit =>
        'La dimensione del file supera il limite massimo${_formatFileSize(errorKey.parameter)}.',
    };
  }

  String _formatFileSize(dynamic sizeInBytes) {
    if (sizeInBytes is int) {
      if (sizeInBytes < 1024) return ' di $sizeInBytes byte';
      if (sizeInBytes < 1048576) return ' di ${(sizeInBytes / 1024).toStringAsFixed(2)} KB';
      return ' di ${(sizeInBytes / 1048576).toStringAsFixed(2)} MB';
    }
    return '';
  }
}
