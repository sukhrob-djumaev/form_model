// import 'package:form_model/src/enums/error_code.dart';
// import 'package:form_model/src/models/form_error.dart';

// import '../form_error_text_translations.dart';

// class FormErrorTextTranslationsPt implements FormErrorTextTranslations {
//   @override
//   String translate(FormErrorKey error) {
//     switch (error.code) {
//       case ErrorCode.required:
//         return "Este campo é obrigatório.";
//       case ErrorCode.lengthIsLessThanMin:
//         return "O comprimento deve ser pelo menos ${error.parameter}.";
//       case ErrorCode.lengthIsMoreThanMax:
//         return "O comprimento deve ser no máximo ${error.parameter}.";
//       case ErrorCode.lengthIsNotEqual:
//         return "O comprimento deve ser exatamente ${error.parameter}.";
//       case ErrorCode.didNotMatchPattern:
//         return "O valor não corresponde ao padrão esperado: ${error.parameter}.";
//       case ErrorCode.isNotOnlyText:
//         return "Este campo deve conter apenas caracteres alfabéticos.";
//       case ErrorCode.isNotOnlyNumbers:
//         return "Este campo deve conter apenas números.";
//       case ErrorCode.isNotValidEmail:
//         return "Este campo requer um endereço de e-mail válido.";
//       case ErrorCode.isNotValidPhoneNumber:
//         return "Este campo requer um número de telefone válido.";
//       case ErrorCode.isNotValidDateTime:
//         return "Este campo requer uma data e hora válidas.";
//       case ErrorCode.dateIsLessThanMinAge:
//         return "O valor deve ter pelo menos ${error.parameter}.";
//       case ErrorCode.dateIsMoreThanMaxAge:
//         return "O valor deve ter no máximo ${error.parameter}.";
//       case ErrorCode.numIsLessThanMin:
//         return "O valor deve ser pelo menos ${error.parameter}.";
//       case ErrorCode.numIsMoreThanMax:
//         return "O valor deve ser no máximo ${error.parameter}.";
//       case ErrorCode.boolShouldBeTrue:
//         return "Este valor deve ser verdadeiro.";
//       case ErrorCode.boolShouldBeFalse:
//         return "Este valor deve ser falso.";
//       case ErrorCode.boolAgreeToTerms:
//         return "Você deve concordar com os termos e condições.";
//       case ErrorCode.intIsNotValidCreditCard:
//         return "Este não é um número de cartão de crédito válido.";
//       case ErrorCode.wordCountIsLessThan:
//         return "A contagem de palavras deve ser pelo menos ${error.parameter}.";
//       case ErrorCode.wordCountIsMoreThan:
//         return "A contagem de palavras deve ser no máximo ${error.parameter}.";
//       case ErrorCode.isNotValidIpAddress:
//         return "Este campo requer um endereço IP válido.";
//       case ErrorCode.isNotValidIpv6Address:
//         return "Este campo requer um endereço IPv6 válido.";
//       case ErrorCode.isNotValidUrl:
//         return "Este campo requer uma URL válida.";
//       case ErrorCode.isNotEqualTo:
//         return "O valor deve ser igual a ${error.parameter}.";
//       case ErrorCode.custom:
//         return "Ocorreu um erro: ${error.customErrorText ?? 'Erro desconhecido'}";
//       default:
//         throw ArgumentError('Código de erro não suportado: ${error.code}');
//     }
//   }
// }
