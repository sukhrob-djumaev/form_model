// import 'package:form_model/src/enums/error_code.dart';
// import 'package:form_model/src/models/form_error.dart';

// import '../form_error_text_translations.dart';

// class FormErrorTextTranslationsEs implements FormErrorTextTranslations {
//   @override
//   String translate(FormErrorKey error) {
//     switch (error.code) {
//       case ErrorCode.required:
//         return "Este campo es obligatorio.";
//       case ErrorCode.lengthIsLessThanMin:
//         return "La longitud debe ser al menos ${error.parameter}.";
//       case ErrorCode.lengthIsMoreThanMax:
//         return "La longitud debe ser como máximo ${error.parameter}.";
//       case ErrorCode.lengthIsNotEqual:
//         return "La longitud debe ser exactamente ${error.parameter}.";
//       case ErrorCode.didNotMatchPattern:
//         return "El valor no coincide con el patrón esperado: ${error.parameter}.";
//       case ErrorCode.isNotOnlyText:
//         return "Este campo debe contener solo caracteres alfabéticos.";
//       case ErrorCode.isNotOnlyNumbers:
//         return "Este campo debe contener solo números.";
//       case ErrorCode.isNotValidEmail:
//         return "Este campo requiere una dirección de correo electrónico válida.";
//       case ErrorCode.isNotValidPhoneNumber:
//         return "Este campo requiere un número de teléfono válido.";
//       case ErrorCode.isNotValidDateTime:
//         return "Este campo requiere una fecha y hora válidas.";
//       case ErrorCode.dateIsLessThanMinAge:
//         return "El valor debe ser al menos ${error.parameter}.";
//       case ErrorCode.dateIsMoreThanMaxAge:
//         return "El valor debe ser como máximo ${error.parameter}.";
//       case ErrorCode.numIsLessThanMin:
//         return "El valor debe ser al menos ${error.parameter}.";
//       case ErrorCode.numIsMoreThanMax:
//         return "El valor debe ser como máximo ${error.parameter}.";
//       case ErrorCode.boolShouldBeTrue:
//         return "Este valor debe ser verdadero.";
//       case ErrorCode.boolShouldBeFalse:
//         return "Este valor debe ser falso.";
//       case ErrorCode.boolAgreeToTerms:
//         return "Debe aceptar los términos y condiciones.";
//       case ErrorCode.intIsNotValidCreditCard:
//         return "Este no es un número de tarjeta de crédito válido.";
//       case ErrorCode.wordCountIsLessThan:
//         return "El recuento de palabras debe ser al menos ${error.parameter}.";
//       case ErrorCode.wordCountIsMoreThan:
//         return "El recuento de palabras debe ser como máximo ${error.parameter}.";
//       case ErrorCode.isNotValidIpAddress:
//         return "Este campo requiere una dirección IP válida.";
//       case ErrorCode.isNotValidIpv6Address:
//         return "Este campo requiere una dirección IPv6 válida.";
//       case ErrorCode.isNotValidUrl:
//         return "Este campo requiere una URL válida.";
//       case ErrorCode.isNotEqualTo:
//         return "El valor debe ser igual a ${error.parameter}.";
//       case ErrorCode.custom:
//         return "Se produjo un error: ${error.customErrorText ?? 'Error desconocido'}";
//       default:
//         throw ArgumentError('Código de error no soportado: ${error.code}');
//     }
//   }
// }
