import 'package:form_model/form_model.dart';

class PredefinedFormErrorKeyTranslationsNl
    implements PredefinedFormErrorKeyTranslations {
  @override
  String translate(PredefinedFormErrorKey errorKey) {
    return switch (errorKey.type) {
      PredefinedFormErrorType.required => 'Dit veld is verplicht.',
      PredefinedFormErrorType.lengthIsLessThanMin =>
        'De lengte moet minimaal ${errorKey.parameter} zijn.',
      PredefinedFormErrorType.lengthIsMoreThanMax =>
        'De lengte mag maximaal ${errorKey.parameter} zijn.',
      PredefinedFormErrorType.lengthIsNotEqual =>
        'De lengte moet precies ${errorKey.parameter} zijn.',
      PredefinedFormErrorType.didNotMatchPattern =>
        'De waarde komt niet overeen met het verwachte patroon: ${errorKey.parameter}.',
      PredefinedFormErrorType.isNotOnlyText =>
        'Dit veld mag alleen alfabetische tekens bevatten.',
      PredefinedFormErrorType.isNotOnlyNumbers =>
        'Dit veld mag alleen cijfers bevatten.',
      PredefinedFormErrorType.isNotValidEmail =>
        'Dit veld vereist een geldig e-mailadres.',
      PredefinedFormErrorType.isNotValidPhoneNumber =>
        'Dit veld vereist een geldig telefoonnummer.',
      PredefinedFormErrorType.isNotValidDateTime =>
        'Dit veld vereist een geldige datum en tijd.',
      PredefinedFormErrorType.dateIsLessThanMinAge =>
        'De waarde moet minimaal ${errorKey.parameter} zijn.',
      PredefinedFormErrorType.dateIsMoreThanMaxAge =>
        'De waarde mag maximaal ${errorKey.parameter} zijn.',
      PredefinedFormErrorType.numIsLessThanMin =>
        'De waarde moet minimaal ${errorKey.parameter} zijn.',
      PredefinedFormErrorType.numIsMoreThanMax =>
        'De waarde mag maximaal ${errorKey.parameter} zijn.',
      PredefinedFormErrorType.boolShouldBeTrue => 'Deze waarde moet waar zijn.',
      PredefinedFormErrorType.boolShouldBeFalse =>
        'Deze waarde moet onwaar zijn.',
      PredefinedFormErrorType.boolAgreeToTerms =>
        'U moet akkoord gaan met de voorwaarden.',
      PredefinedFormErrorType.intIsNotValidCreditCard =>
        'Dit is geen geldig creditcardnummer.',
      PredefinedFormErrorType.wordCountIsLessThan =>
        'Het aantal woorden moet minimaal ${errorKey.parameter} zijn.',
      PredefinedFormErrorType.wordCountIsMoreThan =>
        'Het aantal woorden mag maximaal ${errorKey.parameter} zijn.',
      PredefinedFormErrorType.isNotValidIpAddress =>
        'Dit veld vereist een geldig IP-adres.',
      PredefinedFormErrorType.isNotValidIpv6Address =>
        'Dit veld vereist een geldig IPv6-adres.',
      PredefinedFormErrorType.isNotValidUrl =>
        'Dit veld vereist een geldige URL.',
      PredefinedFormErrorType.isNotEqualTo =>
        'De waarde moet gelijk zijn aan ${errorKey.parameter}.',
      PredefinedFormErrorType.passwordsDoNotMatch =>
        'De wachtwoorden komen niet overeen.',
      PredefinedFormErrorType.passwordTooShort =>
        'Het wachtwoord moet minimaal ${errorKey.parameter} tekens lang zijn.',
      PredefinedFormErrorType.passwordNoUppercase =>
        'Het wachtwoord moet minimaal één hoofdletter bevatten.',
      PredefinedFormErrorType.passwordNoLowercase =>
        'Het wachtwoord moet minimaal één kleine letter bevatten.',
      PredefinedFormErrorType.passwordNoNumber =>
        'Het wachtwoord moet minimaal één cijfer bevatten.',
      PredefinedFormErrorType.passwordNoSpecialChar =>
        'Het wachtwoord moet minimaal één speciaal teken bevatten (${errorKey.parameter}).',
      PredefinedFormErrorType.stringDoesNotContain =>
        'De invoer moet "${errorKey.parameter}" bevatten.',
      PredefinedFormErrorType.stringContains =>
        'De invoer mag "${errorKey.parameter}" niet bevatten.',
      PredefinedFormErrorType.invalidFileType => errorKey.parameter is List
          ? 'Ongeldig bestandstype. Toegestane types zijn: ${(errorKey.parameter as List<String>).join(", ")}.'
          : 'Ongeldig bestandstype.',
      PredefinedFormErrorType.fileSizeExceedsLimit =>
        'De bestandsgrootte overschrijdt de maximale limiet${_formatFileSize(errorKey.parameter)}.',
    };
  }

  String _formatFileSize(dynamic sizeInBytes) {
    if (sizeInBytes is int) {
      if (sizeInBytes < 1024) return ' van $sizeInBytes bytes';
      if (sizeInBytes < 1048576) {
        return ' van ${(sizeInBytes / 1024).toStringAsFixed(2)} KB';
      }
      return ' van ${(sizeInBytes / 1048576).toStringAsFixed(2)} MB';
    }
    return '';
  }
}
