import 'package:form_model/form_model.dart';

class PredefinedFormErrorKeyTranslationsSv
    implements PredefinedFormErrorKeyTranslations {
  @override
  String translate(PredefinedFormErrorKey errorKey) {
    return switch (errorKey.type) {
      PredefinedFormErrorType.required => 'Detta fält är obligatoriskt.',
      PredefinedFormErrorType.lengthIsLessThanMin =>
        'Längden måste vara minst ${errorKey.parameter}.',
      PredefinedFormErrorType.lengthIsMoreThanMax =>
        'Längden får inte överstiga ${errorKey.parameter}.',
      PredefinedFormErrorType.lengthIsNotEqual =>
        'Längden måste vara exakt ${errorKey.parameter}.',
      PredefinedFormErrorType.didNotMatchPattern =>
        'Värdet matchar inte det förväntade mönstret: ${errorKey.parameter}.',
      PredefinedFormErrorType.isNotOnlyText =>
        'Detta fält får endast innehålla bokstäver.',
      PredefinedFormErrorType.isNotOnlyNumbers =>
        'Detta fält får endast innehålla siffror.',
      PredefinedFormErrorType.isNotValidEmail =>
        'Detta fält kräver en giltig e-postadress.',
      PredefinedFormErrorType.isNotValidPhoneNumber =>
        'Detta fält kräver ett giltigt telefonnummer.',
      PredefinedFormErrorType.isNotValidDateTime =>
        'Detta fält kräver ett giltigt datum och tid.',
      PredefinedFormErrorType.dateIsLessThanMinAge =>
        'Värdet måste vara minst ${errorKey.parameter}.',
      PredefinedFormErrorType.dateIsMoreThanMaxAge =>
        'Värdet får inte överstiga ${errorKey.parameter}.',
      PredefinedFormErrorType.numIsLessThanMin =>
        'Värdet måste vara minst ${errorKey.parameter}.',
      PredefinedFormErrorType.numIsMoreThanMax =>
        'Värdet får inte överstiga ${errorKey.parameter}.',
      PredefinedFormErrorType.boolShouldBeTrue =>
        'Detta värde måste vara sant.',
      PredefinedFormErrorType.boolShouldBeFalse =>
        'Detta värde måste vara falskt.',
      PredefinedFormErrorType.boolAgreeToTerms =>
        'Du måste godkänna villkoren.',
      PredefinedFormErrorType.intIsNotValidCreditCard =>
        'Detta är inte ett giltigt kreditkortsnummer.',
      PredefinedFormErrorType.wordCountIsLessThan =>
        'Antalet ord måste vara minst ${errorKey.parameter}.',
      PredefinedFormErrorType.wordCountIsMoreThan =>
        'Antalet ord får inte överstiga ${errorKey.parameter}.',
      PredefinedFormErrorType.isNotValidIpAddress =>
        'Detta fält kräver en giltig IP-adress.',
      PredefinedFormErrorType.isNotValidIpv6Address =>
        'Detta fält kräver en giltig IPv6-adress.',
      PredefinedFormErrorType.isNotValidUrl =>
        'Detta fält kräver en giltig URL.',
      PredefinedFormErrorType.isNotEqualTo =>
        'Värdet måste vara lika med ${errorKey.parameter}.',
      PredefinedFormErrorType.passwordsDoNotMatch => 'Lösenorden matchar inte.',
      PredefinedFormErrorType.passwordTooShort =>
        'Lösenordet måste innehålla minst ${errorKey.parameter} tecken.',
      PredefinedFormErrorType.passwordNoUppercase =>
        'Lösenordet måste innehålla minst en versal.',
      PredefinedFormErrorType.passwordNoLowercase =>
        'Lösenordet måste innehålla minst en gemen.',
      PredefinedFormErrorType.passwordNoNumber =>
        'Lösenordet måste innehålla minst en siffra.',
      PredefinedFormErrorType.passwordNoSpecialChar =>
        'Lösenordet måste innehålla minst ett specialtecken (${errorKey.parameter}).',
      PredefinedFormErrorType.stringDoesNotContain =>
        'Inmatningen måste innehålla "${errorKey.parameter}".',
      PredefinedFormErrorType.stringContains =>
        'Inmatningen får inte innehålla "${errorKey.parameter}".',
      PredefinedFormErrorType.invalidFileType => errorKey.parameter is List
          ? 'Ogiltig filtyp. Tillåtna typer är: ${(errorKey.parameter as List<String>).join(", ")}.'
          : 'Ogiltig filtyp.',
      PredefinedFormErrorType.fileSizeExceedsLimit =>
        'Filstorleken överskrider den maximala gränsen${_formatFileSize(errorKey.parameter)}.',
    };
  }

  String _formatFileSize(dynamic sizeInBytes) {
    if (sizeInBytes is int) {
      if (sizeInBytes < 1024) return ' på $sizeInBytes byte';
      if (sizeInBytes < 1048576)
        return ' på ${(sizeInBytes / 1024).toStringAsFixed(2)} KB';
      return ' på ${(sizeInBytes / 1048576).toStringAsFixed(2)} MB';
    }
    return '';
  }
}
