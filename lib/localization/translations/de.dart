import 'package:form_model/src/enums/error_code.dart';
import 'package:form_model/src/models/form_model_error.dart';

import '../form_error_text_translations.dart';

class FormModelErrorTextTranslationsDe
    implements FormModelErrorTextTranslations {
  @override
  String translate(FormModelError error) {
    switch (error.code) {
      case ErrorCode.required:
        return "Dieses Feld ist erforderlich.";
      case ErrorCode.lengthIsLessThanMin:
        return "Die Länge muss mindestens ${error.parameter} betragen.";
      case ErrorCode.lengthIsMoreThanMax:
        return "Die Länge darf höchstens ${error.parameter} betragen.";
      case ErrorCode.lengthIsNotEqual:
        return "Die Länge muss genau ${error.parameter} betragen.";
      case ErrorCode.didNotMatchPattern:
        return "Der Wert entspricht nicht dem erwarteten Muster: ${error.parameter}.";
      case ErrorCode.isNotOnlyText:
        return "Dieses Feld darf nur alphabetische Zeichen enthalten.";
      case ErrorCode.isNotOnlyNumbers:
        return "Dieses Feld darf nur Zahlen enthalten.";
      case ErrorCode.isNotValidEmail:
        return "Dieses Feld erfordert eine gültige E-Mail-Adresse.";
      case ErrorCode.isNotValidPhoneNumber:
        return "Dieses Feld erfordert eine gültige Telefonnummer.";
      case ErrorCode.isNotValidDateTime:
        return "Dieses Feld erfordert ein gültiges Datum und eine gültige Uhrzeit.";
      case ErrorCode.dateIsLessThanMinAge:
        return "Der Wert muss mindestens ${error.parameter} sein.";
      case ErrorCode.dateIsMoreThanMaxAge:
        return "Der Wert darf höchstens ${error.parameter} sein.";
      case ErrorCode.numIsLessThanMin:
        return "Der Wert muss mindestens ${error.parameter} sein.";
      case ErrorCode.numIsMoreThanMax:
        return "Der Wert darf höchstens ${error.parameter} sein.";
      case ErrorCode.boolShouldBeTrue:
        return "Dieser Wert sollte wahr sein.";
      case ErrorCode.boolShouldBeFalse:
        return "Dieser Wert sollte falsch sein.";
      case ErrorCode.boolAgreeToTerms:
        return "Sie müssen den Bedingungen zustimmen.";
      case ErrorCode.intIsNotValidCreditCard:
        return "Dies ist keine gültige Kreditkartennummer.";
      case ErrorCode.wordCountIsLessThan:
        return "Die Wortanzahl muss mindestens ${error.parameter} betragen.";
      case ErrorCode.wordCountIsMoreThan:
        return "Die Wortanzahl darf höchstens ${error.parameter} betragen.";
      case ErrorCode.isNotValidIpAddress:
        return "Dieses Feld erfordert eine gültige IP-Adresse.";
      case ErrorCode.isNotValidIpv6Address:
        return "Dieses Feld erfordert eine gültige IPv6-Adresse.";
      case ErrorCode.isNotValidUrl:
        return "Dieses Feld erfordert eine gültige URL.";
      case ErrorCode.isNotEqualTo:
        return "Der Wert sollte gleich ${error.parameter} sein.";
      case ErrorCode.custom:
        return "Ein Fehler ist aufgetreten: ${error.customErrorText ?? 'Unbekannter Fehler'}";
      default:
        throw ArgumentError('Nicht unterstützter Fehlercode: ${error.code}');
    }
  }
}
