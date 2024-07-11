import 'package:form_model/src/enums/error_code.dart';
import 'package:form_model/src/models/form_model_error.dart';

import '../form_error_text_translations.dart';

class FormModelErrorTextTranslationsFr
    implements FormModelErrorTextTranslations {
  @override
  String translate(FormModelError error) {
    switch (error.code) {
      case ErrorCode.required:
        return "Ce champ est requis.";
      case ErrorCode.lengthIsLessThanMin:
        return "La longueur doit être d'au moins ${error.parameter}.";
      case ErrorCode.lengthIsMoreThanMax:
        return "La longueur doit être au maximum de ${error.parameter}.";
      case ErrorCode.lengthIsNotEqual:
        return "La longueur doit être exactement de ${error.parameter}.";
      case ErrorCode.didNotMatchPattern:
        return "La valeur ne correspond pas au motif attendu : ${error.parameter}.";
      case ErrorCode.isNotOnlyText:
        return "Ce champ ne doit contenir que des caractères alphabétiques.";
      case ErrorCode.isNotOnlyNumbers:
        return "Ce champ ne doit contenir que des chiffres.";
      case ErrorCode.isNotValidEmail:
        return "Ce champ nécessite une adresse e-mail valide.";
      case ErrorCode.isNotValidPhoneNumber:
        return "Ce champ nécessite un numéro de téléphone valide.";
      case ErrorCode.isNotValidDateTime:
        return "Ce champ nécessite une date et une heure valides.";
      case ErrorCode.dateIsLessThanMinAge:
        return "La valeur doit être d'au moins ${error.parameter}.";
      case ErrorCode.dateIsMoreThanMaxAge:
        return "La valeur doit être au maximum de ${error.parameter}.";
      case ErrorCode.numIsLessThanMin:
        return "La valeur doit être d'au moins ${error.parameter}.";
      case ErrorCode.numIsMoreThanMax:
        return "La valeur doit être au maximum de ${error.parameter}.";
      case ErrorCode.boolShouldBeTrue:
        return "Cette valeur doit être vraie.";
      case ErrorCode.boolShouldBeFalse:
        return "Cette valeur doit être fausse.";
      case ErrorCode.boolAgreeToTerms:
        return "Vous devez accepter les termes et conditions.";
      case ErrorCode.intIsNotValidCreditCard:
        return "Ce numéro de carte de crédit n'est pas valide.";
      case ErrorCode.wordCountIsLessThan:
        return "Le nombre de mots doit être d'au moins ${error.parameter}.";
      case ErrorCode.wordCountIsMoreThan:
        return "Le nombre de mots doit être au maximum de ${error.parameter}.";
      case ErrorCode.isNotValidIpAddress:
        return "Ce champ nécessite une adresse IP valide.";
      case ErrorCode.isNotValidIpv6Address:
        return "Ce champ nécessite une adresse IPv6 valide.";
      case ErrorCode.isNotValidUrl:
        return "Ce champ nécessite une URL valide.";
      case ErrorCode.isNotEqualTo:
        return "La valeur doit être égale à ${error.parameter}.";
      case ErrorCode.custom:
        return "Une erreur s'est produite : ${error.customErrorText ?? 'Erreur inconnue'}";
      default:
        throw ArgumentError('Code d\'erreur non supporté : ${error.code}');
    }
  }
}
