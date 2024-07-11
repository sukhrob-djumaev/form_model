import 'package:form_model/src/enums/error_code.dart';
import 'package:form_model/src/models/form_model_error.dart';

import '../form_error_text_translations.dart';

class FormModelErrorTextTranslationsHi
    implements FormModelErrorTextTranslations {
  @override
  String translate(FormModelError error) {
    switch (error.code) {
      case ErrorCode.required:
        return "यह फ़ील्ड आवश्यक है।";
      case ErrorCode.lengthIsLessThanMin:
        return "लंबाई कम से कम ${error.parameter} होनी चाहिए।";
      case ErrorCode.lengthIsMoreThanMax:
        return "लंबाई अधिकतम ${error.parameter} होनी चाहिए।";
      case ErrorCode.lengthIsNotEqual:
        return "लंबाई ${error.parameter} होनी चाहिए।";
      case ErrorCode.didNotMatchPattern:
        return "मान निर्दिष्ट पैटर्न से मेल नहीं खाता: ${error.parameter}।";
      case ErrorCode.isNotOnlyText:
        return "इस फ़ील्ड में केवल अक्षर होने चाहिए।";
      case ErrorCode.isNotOnlyNumbers:
        return "इस फ़ील्ड में केवल संख्याएँ होनी चाहिए।";
      case ErrorCode.isNotValidEmail:
        return "यह फ़ील्ड में एक मान्य ईमेल पता होना चाहिए।";
      case ErrorCode.isNotValidPhoneNumber:
        return "यह फ़ील्ड में एक मान्य फ़ोन नंबर होना चाहिए।";
      case ErrorCode.isNotValidDateTime:
        return "यह फ़ील्ड में एक मान्य तारीख और समय होना चाहिए।";
      case ErrorCode.dateIsLessThanMinAge:
        return "मान कम से कम ${error.parameter} होना चाहिए।";
      case ErrorCode.dateIsMoreThanMaxAge:
        return "मान अधिकतम ${error.parameter} होना चाहिए।";
      case ErrorCode.numIsLessThanMin:
        return "मान कम से कम ${error.parameter} होना चाहिए।";
      case ErrorCode.numIsMoreThanMax:
        return "मान अधिकतम ${error.parameter} होना चाहिए।";
      case ErrorCode.boolShouldBeTrue:
        return "इस मान को सत्य होना चाहिए।";
      case ErrorCode.boolShouldBeFalse:
        return "इस मान को असत्य होना चाहिए।";
      case ErrorCode.boolAgreeToTerms:
        return "आपको नियम और शर्तों से सहमत होना चाहिए।";
      case ErrorCode.intIsNotValidCreditCard:
        return "यह एक वैध क्रेडिट कार्ड नहीं है।";
      case ErrorCode.wordCountIsLessThan:
        return "शब्दों की संख्या कम से कम ${error.parameter} होनी चाहिए।";
      case ErrorCode.wordCountIsMoreThan:
        return "शब्दों की संख्या अधिकतम ${error.parameter} होनी चाहिए।";
      case ErrorCode.isNotValidIpAddress:
        return "यह फ़ील्ड में एक मान्य IP पता होना चाहिए।";
      case ErrorCode.isNotValidIpv6Address:
        return "यह फ़ील्ड में एक मान्य IPv6 पता होना चाहिए।";
      case ErrorCode.isNotValidUrl:
        return "यह फ़ील्ड में एक मान्य URL होना चाहिए।";
      case ErrorCode.isNotEqualTo:
        return "मूल्य ${error.parameter} के बराबर होना चाहिए।";
      case ErrorCode.custom:
        return "एक त्रुटि हुई: ${error.customErrorText ?? 'अज्ञात त्रुटि'}";
      default:
        throw ArgumentError('असमर्थित त्रुटि कोड: ${error.code}');
    }
  }
}
