import 'package:form_model/form_model.dart';

class PredefinedFormErrorKeyTranslationsAr implements PredefinedFormErrorKeyTranslations {
  @override
  String translate(PredefinedFormErrorKey errorKey) {
    return switch (errorKey.type) {
      PredefinedFormErrorType.required => 'هذا الحقل مطلوب.',
      PredefinedFormErrorType.lengthIsLessThanMin => 'يجب أن يكون الطول ${errorKey.parameter} على الأقل.',
      PredefinedFormErrorType.lengthIsMoreThanMax => 'يجب أن يكون الطول ${errorKey.parameter} كحد أقصى.',
      PredefinedFormErrorType.lengthIsNotEqual => 'يجب أن يكون الطول ${errorKey.parameter} بالضبط.',
      PredefinedFormErrorType.didNotMatchPattern => 'القيمة لا تتطابق مع النمط المتوقع: ${errorKey.parameter}.',
      PredefinedFormErrorType.isNotOnlyText => 'يجب أن يحتوي هذا الحقل على أحرف أبجدية فقط.',
      PredefinedFormErrorType.isNotOnlyNumbers => 'يجب أن يحتوي هذا الحقل على أرقام فقط.',
      PredefinedFormErrorType.isNotValidEmail => 'يتطلب هذا الحقل عنوان بريد إلكتروني صالح.',
      PredefinedFormErrorType.isNotValidPhoneNumber => 'يتطلب هذا الحقل رقم هاتف صالح.',
      PredefinedFormErrorType.isNotValidDateTime => 'يتطلب هذا الحقل تاريخًا ووقتًا صالحين.',
      PredefinedFormErrorType.dateIsLessThanMinAge => 'يجب أن تكون القيمة ${errorKey.parameter} على الأقل.',
      PredefinedFormErrorType.dateIsMoreThanMaxAge => 'يجب أن تكون القيمة ${errorKey.parameter} كحد أقصى.',
      PredefinedFormErrorType.numIsLessThanMin => 'يجب أن تكون القيمة ${errorKey.parameter} على الأقل.',
      PredefinedFormErrorType.numIsMoreThanMax => 'يجب أن تكون القيمة ${errorKey.parameter} كحد أقصى.',
      PredefinedFormErrorType.boolShouldBeTrue => 'يجب أن تكون هذه القيمة صحيحة.',
      PredefinedFormErrorType.boolShouldBeFalse => 'يجب أن تكون هذه القيمة خاطئة.',
      PredefinedFormErrorType.boolAgreeToTerms => 'يجب أن توافق على الشروط والأحكام.',
      PredefinedFormErrorType.intIsNotValidCreditCard => 'هذا ليس رقم بطاقة ائتمان صالح.',
      PredefinedFormErrorType.wordCountIsLessThan => 'يجب أن يكون عدد الكلمات ${errorKey.parameter} على الأقل.',
      PredefinedFormErrorType.wordCountIsMoreThan => 'يجب أن يكون عدد الكلمات ${errorKey.parameter} كحد أقصى.',
      PredefinedFormErrorType.isNotValidIpAddress => 'يتطلب هذا الحقل عنوان IP صالح.',
      PredefinedFormErrorType.isNotValidIpv6Address => 'يتطلب هذا الحقل عنوان IPv6 صالح.',
      PredefinedFormErrorType.isNotValidUrl => 'يتطلب هذا الحقل عنوان URL صالح.',
      PredefinedFormErrorType.isNotEqualTo => 'يجب أن تكون القيمة مساوية لـ ${errorKey.parameter}.',
      PredefinedFormErrorType.passwordsDoNotMatch => 'كلمات المرور غير متطابقة.',
      PredefinedFormErrorType.passwordTooShort => 'يجب أن تكون كلمة المرور ${errorKey.parameter} حرفًا على الأقل.',
      PredefinedFormErrorType.passwordNoUppercase => 'يجب أن تحتوي كلمة المرور على حرف كبير واحد على الأقل.',
      PredefinedFormErrorType.passwordNoLowercase => 'يجب أن تحتوي كلمة المرور على حرف صغير واحد على الأقل.',
      PredefinedFormErrorType.passwordNoNumber => 'يجب أن تحتوي كلمة المرور على رقم واحد على الأقل.',
      PredefinedFormErrorType.passwordNoSpecialChar =>
        'يجب أن تحتوي كلمة المرور على حرف خاص واحد على الأقل (${errorKey.parameter}).',
      PredefinedFormErrorType.stringDoesNotContain => 'يجب أن يحتوي النص على "${errorKey.parameter}".',
      PredefinedFormErrorType.stringContains => 'يجب ألا يحتوي النص على "${errorKey.parameter}".',
      PredefinedFormErrorType.invalidFileType => errorKey.parameter is List
          ? 'نوع ملف غير صالح. الأنواع المسموح بها هي: ${(errorKey.parameter as List<String>).join("، ")}.'
          : 'نوع ملف غير صالح.',
      PredefinedFormErrorType.fileSizeExceedsLimit =>
        'حجم الملف يتجاوز الحد الأقصى${_formatFileSize(errorKey.parameter)}.',
    };
  }

  String _formatFileSize(dynamic sizeInBytes) {
    if (sizeInBytes is int) {
      if (sizeInBytes < 1024) return ' $sizeInBytes بايت';
      if (sizeInBytes < 1048576) return ' ${(sizeInBytes / 1024).toStringAsFixed(2)} كيلوبايت';
      return ' ${(sizeInBytes / 1048576).toStringAsFixed(2)} ميغابايت';
    }
    return '';
  }
}
