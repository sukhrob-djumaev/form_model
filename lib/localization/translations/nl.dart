import 'package:form_model/src/enums/error_code.dart';
import 'package:form_model/src/models/form_error.dart';

import '../form_error_text_translations.dart';

class FormErrorTextTranslationsNl implements FormErrorTextTranslations {
  @override
  String translate(FormError error) {
    switch (error.code) {
      case ErrorCode.required:
        return "Dit veld is verplicht.";
      case ErrorCode.lengthIsLessThanMin:
        return "De lengte moet minimaal ${error.parameter} zijn.";
      case ErrorCode.lengthIsMoreThanMax:
        return "De lengte moet maximaal ${error.parameter} zijn.";
      case ErrorCode.lengthIsNotEqual:
        return "De lengte moet precies ${error.parameter} zijn.";
      case ErrorCode.didNotMatchPattern:
        return "De waarde komt niet overeen met het verwachte patroon: ${error.parameter}.";
      case ErrorCode.isNotOnlyText:
        return "Dit veld mag alleen alfabetische tekens bevatten.";
      case ErrorCode.isNotOnlyNumbers:
        return "Dit veld mag alleen cijfers bevatten.";
      case ErrorCode.isNotValidEmail:
        return "Voer een geldig e-mailadres in.";
      case ErrorCode.isNotValidPhoneNumber:
        return "Voer een geldig telefoonnummer in.";
      case ErrorCode.isNotValidDateTime:
        return "Voer een geldige datum en tijd in.";
      case ErrorCode.dateIsLessThanMinAge:
        return "De waarde moet minstens ${error.parameter} zijn.";
      case ErrorCode.dateIsMoreThanMaxAge:
        return "De waarde mag maximaal ${error.parameter} zijn.";
      case ErrorCode.numIsLessThanMin:
        return "De waarde moet minstens ${error.parameter} zijn.";
      case ErrorCode.numIsMoreThanMax:
        return "De waarde mag maximaal ${error.parameter} zijn.";
      case ErrorCode.boolShouldBeTrue:
        return "Deze waarde moet waar zijn.";
      case ErrorCode.boolShouldBeFalse:
        return "Deze waarde moet onwaar zijn.";
      case ErrorCode.boolAgreeToTerms:
        return "U moet akkoord gaan met de voorwaarden.";
      case ErrorCode.intIsNotValidCreditCard:
        return "Dit is geen geldig creditcardnummer.";
      case ErrorCode.wordCountIsLessThan:
        return "Het aantal woorden moet minstens ${error.parameter} zijn.";
      case ErrorCode.wordCountIsMoreThan:
        return "Het aantal woorden mag maximaal ${error.parameter} zijn.";
      case ErrorCode.isNotValidIpAddress:
        return "Voer een geldig IP-adres in.";
      case ErrorCode.isNotValidIpv6Address:
        return "Voer een geldig IPv6-adres in.";
      case ErrorCode.isNotValidUrl:
        return "Voer een geldige URL in.";
      case ErrorCode.isNotEqualTo:
        return "De waarde moet gelijk zijn aan ${error.parameter}.";
      case ErrorCode.custom:
        return "Er is een fout opgetreden: ${error.parameter ?? 'Onbekende fout'}";
      default:
        throw ArgumentError('Niet-ondersteunde foutcode: ${error.code}');
    }
  }
}
