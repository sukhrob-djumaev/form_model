// import 'package:form_model/src/enums/error_code.dart';
// import 'package:form_model/src/models/form_error.dart';

// import '../form_error_text_translations.dart';

// class FormErrorTextTranslationsKo implements FormErrorTextTranslations {
//   @override
//   String translate(FormErrorKey error) {
//     switch (error.code) {
//       case ErrorCode.required:
//         return "이 필드는 필수입니다.";
//       case ErrorCode.lengthIsLessThanMin:
//         return "길이는 최소 ${error.parameter} 이상이어야 합니다.";
//       case ErrorCode.lengthIsMoreThanMax:
//         return "길이는 최대 ${error.parameter} 이하여야 합니다.";
//       case ErrorCode.lengthIsNotEqual:
//         return "길이는 정확히 ${error.parameter} 이어야 합니다.";
//       case ErrorCode.didNotMatchPattern:
//         return "값이 예상 패턴과 일치하지 않습니다: ${error.parameter}.";
//       case ErrorCode.isNotOnlyText:
//         return "이 필드에는 알파벳 문자만 포함되어야 합니다.";
//       case ErrorCode.isNotOnlyNumbers:
//         return "이 필드에는 숫자만 포함되어야 합니다.";
//       case ErrorCode.isNotValidEmail:
//         return "유효한 이메일 주소를 입력해야 합니다.";
//       case ErrorCode.isNotValidPhoneNumber:
//         return "유효한 전화번호를 입력해야 합니다.";
//       case ErrorCode.isNotValidDateTime:
//         return "유효한 날짜와 시간을 입력해야 합니다.";
//       case ErrorCode.dateIsLessThanMinAge:
//         return "값은 최소 ${error.parameter} 이어야 합니다.";
//       case ErrorCode.dateIsMoreThanMaxAge:
//         return "값은 최대 ${error.parameter} 이하여야 합니다.";
//       case ErrorCode.numIsLessThanMin:
//         return "값은 최소 ${error.parameter} 이어야 합니다.";
//       case ErrorCode.numIsMoreThanMax:
//         return "값은 최대 ${error.parameter} 이하여야 합니다.";
//       case ErrorCode.boolShouldBeTrue:
//         return "이 값은 true 여야 합니다.";
//       case ErrorCode.boolShouldBeFalse:
//         return "이 값은 false 여야 합니다.";
//       case ErrorCode.boolAgreeToTerms:
//         return "약관에 동의해야 합니다.";
//       case ErrorCode.intIsNotValidCreditCard:
//         return "유효하지 않은 신용카드 번호입니다.";
//       case ErrorCode.wordCountIsLessThan:
//         return "단어 수는 최소 ${error.parameter} 이어야 합니다.";
//       case ErrorCode.wordCountIsMoreThan:
//         return "단어 수는 최대 ${error.parameter} 이하여야 합니다.";
//       case ErrorCode.isNotValidIpAddress:
//         return "유효한 IP 주소를 입력해야 합니다.";
//       case ErrorCode.isNotValidIpv6Address:
//         return "유효한 IPv6 주소를 입력해야 합니다.";
//       case ErrorCode.isNotValidUrl:
//         return "유효한 URL을 입력해야 합니다.";
//       case ErrorCode.isNotEqualTo:
//         return "값은 ${error.parameter}와 같아야 합니다.";
//       case ErrorCode.custom:
//         return "오류가 발생했습니다: ${error.parameter ?? '알 수 없는 오류'}";
//       default:
//         throw ArgumentError('지원되지 않는 오류 코드: ${error.code}');
//     }
//   }
// }
