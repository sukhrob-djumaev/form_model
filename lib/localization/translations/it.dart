// import 'package:form_model/src/enums/error_code.dart';
// import 'package:form_model/src/models/form_error.dart';

// import '../form_error_text_translations.dart';

// class FormErrorTextTranslationsIt implements FormErrorTextTranslations {
//   @override
//   String translate(FormErrorKey error) {
//     switch (error.code) {
//       case ErrorCode.required:
//         return "Questo campo è obbligatorio.";
//       case ErrorCode.lengthIsLessThanMin:
//         return "La lunghezza deve essere almeno ${error.parameter}.";
//       case ErrorCode.lengthIsMoreThanMax:
//         return "La lunghezza deve essere al massimo ${error.parameter}.";
//       case ErrorCode.lengthIsNotEqual:
//         return "La lunghezza deve essere esattamente ${error.parameter}.";
//       case ErrorCode.didNotMatchPattern:
//         return "Il valore non corrisponde al pattern atteso: ${error.parameter}.";
//       case ErrorCode.isNotOnlyText:
//         return "Questo campo deve contenere solo caratteri alfabetici.";
//       case ErrorCode.isNotOnlyNumbers:
//         return "Questo campo deve contenere solo numeri.";
//       case ErrorCode.isNotValidEmail:
//         return "Questo campo richiede un indirizzo email valido.";
//       case ErrorCode.isNotValidPhoneNumber:
//         return "Questo campo richiede un numero di telefono valido.";
//       case ErrorCode.isNotValidDateTime:
//         return "Questo campo richiede una data e un'ora validi.";
//       case ErrorCode.dateIsLessThanMinAge:
//         return "Il valore deve essere almeno ${error.parameter}.";
//       case ErrorCode.dateIsMoreThanMaxAge:
//         return "Il valore deve essere al massimo ${error.parameter}.";
//       case ErrorCode.numIsLessThanMin:
//         return "Il valore deve essere almeno ${error.parameter}.";
//       case ErrorCode.numIsMoreThanMax:
//         return "Il valore deve essere al massimo ${error.parameter}.";
//       case ErrorCode.boolShouldBeTrue:
//         return "Questo valore deve essere vero.";
//       case ErrorCode.boolShouldBeFalse:
//         return "Questo valore deve essere falso.";
//       case ErrorCode.boolAgreeToTerms:
//         return "È necessario accettare i termini e le condizioni.";
//       case ErrorCode.intIsNotValidCreditCard:
//         return "Questo non è un numero di carta di credito valido.";
//       case ErrorCode.wordCountIsLessThan:
//         return "Il conteggio delle parole deve essere almeno ${error.parameter}.";
//       case ErrorCode.wordCountIsMoreThan:
//         return "Il conteggio delle parole deve essere al massimo ${error.parameter}.";
//       case ErrorCode.isNotValidIpAddress:
//         return "Questo campo richiede un indirizzo IP valido.";
//       case ErrorCode.isNotValidIpv6Address:
//         return "Questo campo richiede un indirizzo IPv6 valido.";
//       case ErrorCode.isNotValidUrl:
//         return "Questo campo richiede un URL valido.";
//       case ErrorCode.isNotEqualTo:
//         return "Il valore deve essere uguale a ${error.parameter}.";
//       case ErrorCode.custom:
//         return "Si è verificato un errore: ${error.parameter ?? 'Errore sconosciuto'}";
//       default:
//         throw ArgumentError('Codice di errore non supportato: ${error.code}');
//     }
//   }
// }
