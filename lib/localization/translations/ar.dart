import 'package:form_model/src/enums/error_code.dart';
import 'package:form_model/src/models/form_error.dart';

import '../form_error_text_translations.dart';

class FormErrorTextTranslationsAr implements FormErrorTextTranslations {
  @override
  String translate(FormError error) {
    switch (error.code) {
      case ErrorCode.required:
        return "هذا الحقل مطلوب.";
      case ErrorCode.lengthIsLessThanMin:
        return "يجب أن يكون طول النص على الأقل ${error.parameter}.";
      case ErrorCode.lengthIsMoreThanMax:
        return "يجب أن يكون طول النص كحد أقصى ${error.parameter}.";
      case ErrorCode.lengthIsNotEqual:
        return "يجب أن يكون طول النص مطابقًا لـ ${error.parameter}.";
      case ErrorCode.didNotMatchPattern:
        return "القيمة لا تتطابق مع النمط المتوقع: ${error.parameter}.";
      case ErrorCode.isNotOnlyText:
        return "يجب أن يحتوي هذا الحقل على أحرف أبجدية فقط.";
      case ErrorCode.isNotOnlyNumbers:
        return "يجب أن يحتوي هذا الحقل على أرقام فقط.";
      case ErrorCode.isNotValidEmail:
        return "هذا الحقل يتطلب عنوان بريد إلكتروني صالح.";
      case ErrorCode.isNotValidPhoneNumber:
        return "هذا الحقل يتطلب رقم هاتف صالح.";
      case ErrorCode.isNotValidDateTime:
        return "هذا الحقل يتطلب تاريخ ووقت صالحين.";
      case ErrorCode.dateIsLessThanMinAge:
        return "يجب أن تكون القيمة على الأقل ${error.parameter}.";
      case ErrorCode.dateIsMoreThanMaxAge:
        return "يجب أن تكون القيمة كحد أقصى ${error.parameter}.";
      case ErrorCode.numIsLessThanMin:
        return "يجب أن تكون القيمة على الأقل ${error.parameter}.";
      case ErrorCode.numIsMoreThanMax:
        return "يجب أن تكون القيمة كحد أقصى ${error.parameter}.";
      case ErrorCode.boolShouldBeTrue:
        return "يجب أن تكون القيمة صحيحة (true).";
      case ErrorCode.boolShouldBeFalse:
        return "يجب أن تكون القيمة خاطئة (false).";
      case ErrorCode.boolAgreeToTerms:
        return "يجب أن توافق على الشروط والأحكام.";
      case ErrorCode.intIsNotValidCreditCard:
        return "هذا ليس رقم بطاقة ائتمان صالح.";
      case ErrorCode.wordCountIsLessThan:
        return "يجب أن يكون عدد الكلمات على الأقل ${error.parameter}.";
      case ErrorCode.wordCountIsMoreThan:
        return "يجب أن يكون عدد الكلمات كحد أقصى ${error.parameter}.";
      case ErrorCode.isNotValidIpAddress:
        return "هذا الحقل يتطلب عنوان IP صالح.";
      case ErrorCode.isNotValidIpv6Address:
        return "هذا الحقل يتطلب عنوان IPv6 صالح.";
      case ErrorCode.isNotValidUrl:
        return "هذا الحقل يتطلب رابط URL صالح.";
      case ErrorCode.isNotEqualTo:
        return "يجب أن تكون القيمة مساوية لـ ${error.parameter}.";
      case ErrorCode.custom:
        return "حدث خطأ: ${error.parameter ?? 'خطأ غير معروف'}";
      default:
        throw ArgumentError('كود الخطأ غير مدعوم: ${error.code}');
    }
  }
}
