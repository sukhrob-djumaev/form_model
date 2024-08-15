import 'package:form_model/form_model.dart';

class PredefinedFormErrorKeyTranslationsHi
    implements PredefinedFormErrorKeyTranslations {
  @override
  String translate(PredefinedFormErrorKey errorKey) {
    return switch (errorKey.type) {
      PredefinedFormErrorType.required => 'यह फ़ील्ड आवश्यक है।',
      PredefinedFormErrorType.lengthIsLessThanMin =>
        'लंबाई कम से कम ${errorKey.parameter} होनी चाहिए।',
      PredefinedFormErrorType.lengthIsMoreThanMax =>
        'लंबाई अधिकतम ${errorKey.parameter} होनी चाहिए।',
      PredefinedFormErrorType.lengthIsNotEqual =>
        'लंबाई ठीक ${errorKey.parameter} होनी चाहिए।',
      PredefinedFormErrorType.didNotMatchPattern =>
        'मान अपेक्षित पैटर्न से मेल नहीं खाता: ${errorKey.parameter}।',
      PredefinedFormErrorType.isNotOnlyText =>
        'इस फ़ील्ड में केवल अक्षर होने चाहिए।',
      PredefinedFormErrorType.isNotOnlyNumbers =>
        'इस फ़ील्ड में केवल संख्याएँ होनी चाहिए।',
      PredefinedFormErrorType.isNotValidEmail =>
        'इस फ़ील्ड में एक वैध ईमेल पता होना चाहिए।',
      PredefinedFormErrorType.isNotValidPhoneNumber =>
        'इस फ़ील्ड में एक वैध फ़ोन नंबर होना चाहिए।',
      PredefinedFormErrorType.isNotValidDateTime =>
        'इस फ़ील्ड में एक वैध दिनांक और समय होना चाहिए।',
      PredefinedFormErrorType.dateIsLessThanMinAge =>
        'मान कम से कम ${errorKey.parameter} होना चाहिए।',
      PredefinedFormErrorType.dateIsMoreThanMaxAge =>
        'मान अधिकतम ${errorKey.parameter} होना चाहिए।',
      PredefinedFormErrorType.numIsLessThanMin =>
        'मान कम से कम ${errorKey.parameter} होना चाहिए।',
      PredefinedFormErrorType.numIsMoreThanMax =>
        'मान अधिकतम ${errorKey.parameter} होना चाहिए।',
      PredefinedFormErrorType.boolShouldBeTrue => 'यह मान सत्य होना चाहिए।',
      PredefinedFormErrorType.boolShouldBeFalse => 'यह मान असत्य होना चाहिए।',
      PredefinedFormErrorType.boolAgreeToTerms =>
        'आपको नियम और शर्तों से सहमत होना चाहिए।',
      PredefinedFormErrorType.intIsNotValidCreditCard =>
        'यह एक वैध क्रेडिट कार्ड नंबर नहीं है।',
      PredefinedFormErrorType.wordCountIsLessThan =>
        'शब्द संख्या कम से कम ${errorKey.parameter} होनी चाहिए।',
      PredefinedFormErrorType.wordCountIsMoreThan =>
        'शब्द संख्या अधिकतम ${errorKey.parameter} होनी चाहिए।',
      PredefinedFormErrorType.isNotValidIpAddress =>
        'इस फ़ील्ड में एक वैध IP पता होना चाहिए।',
      PredefinedFormErrorType.isNotValidIpv6Address =>
        'इस फ़ील्ड में एक वैध IPv6 पता होना चाहिए।',
      PredefinedFormErrorType.isNotValidUrl =>
        'इस फ़ील्ड में एक वैध URL होना चाहिए।',
      PredefinedFormErrorType.isNotEqualTo =>
        'मान ${errorKey.parameter} के बराबर होना चाहिए।',
      PredefinedFormErrorType.passwordsDoNotMatch => 'पासवर्ड मेल नहीं खाते।',
      PredefinedFormErrorType.passwordTooShort =>
        'पासवर्D कम से कम ${errorKey.parameter} अक्षर लंबा होना चाहिए।',
      PredefinedFormErrorType.passwordNoUppercase =>
        'पासवर्ड में कम से कम एक अपरकेस अक्षर होना चाहिए।',
      PredefinedFormErrorType.passwordNoLowercase =>
        'पासवर्ड में कम से कम एक लोअरकेस अक्षर होना चाहिए।',
      PredefinedFormErrorType.passwordNoNumber =>
        'पासवर्ड में कम से कम एक संख्या होनी चाहिए।',
      PredefinedFormErrorType.passwordNoSpecialChar =>
        'पासवर्ड में कम से कम एक विशेष वर्ण होना चाहिए (${errorKey.parameter})।',
      PredefinedFormErrorType.stringDoesNotContain =>
        'इनपुट में "${errorKey.parameter}" शामिल होना चाहिए।',
      PredefinedFormErrorType.stringContains =>
        'इनपुट में "${errorKey.parameter}" शामिल नहीं होना चाहिए।',
      PredefinedFormErrorType.invalidFileType => errorKey.parameter is List
          ? 'अमान्य फ़ाइल प्रकार। अनुमत प्रकार हैं: ${(errorKey.parameter as List<String>).join(", ")}।'
          : 'अमान्य फ़ाइल प्रकार।',
      PredefinedFormErrorType.fileSizeExceedsLimit =>
        'फ़ाइल का आकार अधिकतम सीमा से अधिक है${_formatFileSize(errorKey.parameter)}।',
    };
  }

  String _formatFileSize(dynamic sizeInBytes) {
    if (sizeInBytes is int) {
      if (sizeInBytes < 1024) return '$sizeInBytes बाइट';
      if (sizeInBytes < 1048576) {
        return '${(sizeInBytes / 1024).toStringAsFixed(2)} KB';
      }
      return '${(sizeInBytes / 1048576).toStringAsFixed(2)} MB';
    }
    return '';
  }
}
