// import 'package:form_model/src/enums/error_code.dart';
// import 'package:form_model/src/models/form_error.dart';

// import '../form_error_text_translations.dart';

// class FormErrorTextTranslationsUk implements FormErrorTextTranslations {
//   @override
//   String translate(FormErrorKey error) {
//     switch (error.code) {
//       case ErrorCode.required:
//         return "Це поле є обов'язковим.";
//       case ErrorCode.lengthIsLessThanMin:
//         return "Довжина повинна бути не менше ${error.parameter}.";
//       case ErrorCode.lengthIsMoreThanMax:
//         return "Довжина повинна бути не більше ${error.parameter}.";
//       case ErrorCode.lengthIsNotEqual:
//         return "Довжина повинна бути рівна ${error.parameter}.";
//       case ErrorCode.didNotMatchPattern:
//         return "Значення не відповідає очікуваному шаблону: ${error.parameter}.";
//       case ErrorCode.isNotOnlyText:
//         return "Це поле повинно містити тільки букви.";
//       case ErrorCode.isNotOnlyNumbers:
//         return "Це поле повинно містити тільки цифри.";
//       case ErrorCode.isNotValidEmail:
//         return "Введіть дійсну електронну адресу.";
//       case ErrorCode.isNotValidPhoneNumber:
//         return "Введіть дійсний номер телефону.";
//       case ErrorCode.isNotValidDateTime:
//         return "Введіть дійсну дату та час.";
//       case ErrorCode.dateIsLessThanMinAge:
//         return "Значення повинно бути не менше ${error.parameter}.";
//       case ErrorCode.dateIsMoreThanMaxAge:
//         return "Значення повинно бути не більше ${error.parameter}.";
//       case ErrorCode.numIsLessThanMin:
//         return "Значення повинно бути не менше ${error.parameter}.";
//       case ErrorCode.numIsMoreThanMax:
//         return "Значення повинно бути не більше ${error.parameter}.";
//       case ErrorCode.boolShouldBeTrue:
//         return "Це значення повинно бути істинним.";
//       case ErrorCode.boolShouldBeFalse:
//         return "Це значення повинно бути хибним.";
//       case ErrorCode.boolAgreeToTerms:
//         return "Ви повинні погодитися з умовами та положеннями.";
//       case ErrorCode.intIsNotValidCreditCard:
//         return "Це не є дійсним номером кредитної картки.";
//       case ErrorCode.wordCountIsLessThan:
//         return "Кількість слів повинна бути не менше ${error.parameter}.";
//       case ErrorCode.wordCountIsMoreThan:
//         return "Кількість слів повинна бути не більше ${error.parameter}.";
//       case ErrorCode.isNotValidIpAddress:
//         return "Введіть дійсну IP-адресу.";
//       case ErrorCode.isNotValidIpv6Address:
//         return "Введіть дійсну IPv6-адресу.";
//       case ErrorCode.isNotValidUrl:
//         return "Введіть дійсну URL-адресу.";
//       case ErrorCode.isNotEqualTo:
//         return "Значення повинно дорівнювати ${error.parameter}.";
//       case ErrorCode.custom:
//         return "Сталася помилка: ${error.parameter ?? 'Невідома помилка'}";
//       default:
//         throw ArgumentError('Непідтримуваний код помилки: ${error.code}');
//     }
//   }
// }
