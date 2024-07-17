// import 'package:form_model/src/enums/error_code.dart';
// import 'package:form_model/src/models/form_error.dart';

// import '../form_error_text_translations.dart';

// class FormErrorTextTranslationsVi implements FormErrorTextTranslations {
//   @override
//   String translate(FormErrorKey error) {
//     switch (error.code) {
//       case ErrorCode.required:
//         return "Trường này là bắt buộc.";
//       case ErrorCode.lengthIsLessThanMin:
//         return "Độ dài phải ít nhất là ${error.parameter}.";
//       case ErrorCode.lengthIsMoreThanMax:
//         return "Độ dài tối đa là ${error.parameter}.";
//       case ErrorCode.lengthIsNotEqual:
//         return "Độ dài phải chính xác là ${error.parameter}.";
//       case ErrorCode.didNotMatchPattern:
//         return "Giá trị không khớp với mẫu mong đợi: ${error.parameter}.";
//       case ErrorCode.isNotOnlyText:
//         return "Trường này chỉ được chứa các ký tự chữ cái.";
//       case ErrorCode.isNotOnlyNumbers:
//         return "Trường này chỉ được chứa các ký tự số.";
//       case ErrorCode.isNotValidEmail:
//         return "Hãy nhập địa chỉ email hợp lệ.";
//       case ErrorCode.isNotValidPhoneNumber:
//         return "Hãy nhập số điện thoại hợp lệ.";
//       case ErrorCode.isNotValidDateTime:
//         return "Hãy nhập ngày giờ hợp lệ.";
//       case ErrorCode.dateIsLessThanMinAge:
//         return "Giá trị phải ít nhất là ${error.parameter}.";
//       case ErrorCode.dateIsMoreThanMaxAge:
//         return "Giá trị tối đa là ${error.parameter}.";
//       case ErrorCode.numIsLessThanMin:
//         return "Giá trị phải ít nhất là ${error.parameter}.";
//       case ErrorCode.numIsMoreThanMax:
//         return "Giá trị tối đa là ${error.parameter}.";
//       case ErrorCode.boolShouldBeTrue:
//         return "Giá trị này phải là đúng.";
//       case ErrorCode.boolShouldBeFalse:
//         return "Giá trị này phải là sai.";
//       case ErrorCode.boolAgreeToTerms:
//         return "Bạn phải đồng ý với các điều khoản và điều kiện.";
//       case ErrorCode.intIsNotValidCreditCard:
//         return "Đây không phải là số thẻ tín dụng hợp lệ.";
//       case ErrorCode.wordCountIsLessThan:
//         return "Số từ phải ít nhất là ${error.parameter}.";
//       case ErrorCode.wordCountIsMoreThan:
//         return "Số từ tối đa là ${error.parameter}.";
//       case ErrorCode.isNotValidIpAddress:
//         return "Hãy nhập địa chỉ IP hợp lệ.";
//       case ErrorCode.isNotValidIpv6Address:
//         return "Hãy nhập địa chỉ IPv6 hợp lệ.";
//       case ErrorCode.isNotValidUrl:
//         return "Hãy nhập URL hợp lệ.";
//       case ErrorCode.isNotEqualTo:
//         return "Giá trị phải bằng ${error.parameter}.";
//       case ErrorCode.custom:
//         return "Đã xảy ra lỗi: ${error.parameter ?? 'Lỗi không xác định'}";
//       default:
//         throw ArgumentError('Mã lỗi không được hỗ trợ: ${error.code}');
//     }
//   }
// }
