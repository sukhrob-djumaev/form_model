import 'package:form_model/form_model.dart';

class PredefinedFormErrorKeyTranslationsFr implements PredefinedFormErrorKeyTranslations {
  @override
  String translate(PredefinedFormErrorKey errorKey) {
    return switch (errorKey.type) {
      PredefinedFormErrorType.required => 'Ce champ est obligatoire.',
      PredefinedFormErrorType.lengthIsLessThanMin => 'La longueur doit être d\'au moins ${errorKey.parameter}.',
      PredefinedFormErrorType.lengthIsMoreThanMax => 'La longueur doit être au maximum de ${errorKey.parameter}.',
      PredefinedFormErrorType.lengthIsNotEqual => 'La longueur doit être exactement de ${errorKey.parameter}.',
      PredefinedFormErrorType.didNotMatchPattern =>
        'La valeur ne correspond pas au modèle attendu : ${errorKey.parameter}.',
      PredefinedFormErrorType.isNotOnlyText => 'Ce champ ne doit contenir que des caractères alphabétiques.',
      PredefinedFormErrorType.isNotOnlyNumbers => 'Ce champ ne doit contenir que des chiffres.',
      PredefinedFormErrorType.isNotValidEmail => 'Ce champ nécessite une adresse e-mail valide.',
      PredefinedFormErrorType.isNotValidPhoneNumber => 'Ce champ nécessite un numéro de téléphone valide.',
      PredefinedFormErrorType.isNotValidDateTime => 'Ce champ nécessite une date et une heure valides.',
      PredefinedFormErrorType.dateIsLessThanMinAge => 'La valeur doit être d\'au moins ${errorKey.parameter}.',
      PredefinedFormErrorType.dateIsMoreThanMaxAge => 'La valeur doit être au maximum de ${errorKey.parameter}.',
      PredefinedFormErrorType.numIsLessThanMin => 'La valeur doit être d\'au moins ${errorKey.parameter}.',
      PredefinedFormErrorType.numIsMoreThanMax => 'La valeur doit être au maximum de ${errorKey.parameter}.',
      PredefinedFormErrorType.boolShouldBeTrue => 'Cette valeur doit être vraie.',
      PredefinedFormErrorType.boolShouldBeFalse => 'Cette valeur doit être fausse.',
      PredefinedFormErrorType.boolAgreeToTerms => 'Vous devez accepter les termes et conditions.',
      PredefinedFormErrorType.intIsNotValidCreditCard => 'Ce n\'est pas un numéro de carte de crédit valide.',
      PredefinedFormErrorType.wordCountIsLessThan => 'Le nombre de mots doit être d\'au moins ${errorKey.parameter}.',
      PredefinedFormErrorType.wordCountIsMoreThan => 'Le nombre de mots doit être au maximum de ${errorKey.parameter}.',
      PredefinedFormErrorType.isNotValidIpAddress => 'Ce champ nécessite une adresse IP valide.',
      PredefinedFormErrorType.isNotValidIpv6Address => 'Ce champ nécessite une adresse IPv6 valide.',
      PredefinedFormErrorType.isNotValidUrl => 'Ce champ nécessite une URL valide.',
      PredefinedFormErrorType.isNotEqualTo => 'La valeur doit être égale à ${errorKey.parameter}.',
      PredefinedFormErrorType.passwordsDoNotMatch => 'Les mots de passe ne correspondent pas.',
      PredefinedFormErrorType.passwordTooShort =>
        'Le mot de passe doit contenir au moins ${errorKey.parameter} caractères.',
      PredefinedFormErrorType.passwordNoUppercase => 'Le mot de passe doit contenir au moins une lettre majuscule.',
      PredefinedFormErrorType.passwordNoLowercase => 'Le mot de passe doit contenir au moins une lettre minuscule.',
      PredefinedFormErrorType.passwordNoNumber => 'Le mot de passe doit contenir au moins un chiffre.',
      PredefinedFormErrorType.passwordNoSpecialChar =>
        'Le mot de passe doit contenir au moins un caractère spécial (${errorKey.parameter}).',
      PredefinedFormErrorType.stringDoesNotContain => 'Le texte doit contenir "${errorKey.parameter}".',
      PredefinedFormErrorType.stringContains => 'Le texte ne doit pas contenir "${errorKey.parameter}".',
      PredefinedFormErrorType.invalidFileType => errorKey.parameter is List
          ? 'Type de fichier invalide. Les types autorisés sont : ${(errorKey.parameter as List<String>).join(", ")}.'
          : 'Type de fichier invalide.',
      PredefinedFormErrorType.fileSizeExceedsLimit =>
        'La taille du fichier dépasse la limite maximale${_formatFileSize(errorKey.parameter)}.',
    };
  }

  String _formatFileSize(dynamic sizeInBytes) {
    if (sizeInBytes is int) {
      if (sizeInBytes < 1024) return '$sizeInBytes o';
      if (sizeInBytes < 1048576) return '${(sizeInBytes / 1024).toStringAsFixed(2)} Ko';
      return ' de ${(sizeInBytes / 1048576).toStringAsFixed(2)} Mo';
    }
    return '';
  }
}
