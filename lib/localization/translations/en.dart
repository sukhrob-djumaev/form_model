import 'package:form_model/src/enums/error_code.dart';
import 'package:form_model/src/model/form_model_error.dart';

import '../form_error_text_translations.dart';

class FormModelErrorTextTranslationsEn
    implements FormModelErrorTextTranslations {
  @override
  String translate(FormModelError error) {
    switch (error.code) {
      case ErrorCode.required:
        return "This field is required.";
      case ErrorCode.lengthIsLessThanMin:
        return "The length should be at least ${error.parameter}.";
      case ErrorCode.lengthIsMoreThanMax:
        return "The length should be at most ${error.parameter}.";
      case ErrorCode.lengthIsNotEqual:
        return "The length should be exactly ${error.parameter}.";
      case ErrorCode.didNotMatchPattern:
        return "The value did not match the expected pattern: ${error.parameter}.";
      case ErrorCode.isNotOnlyText:
        return "This field should contain only alphabetic characters.";
      case ErrorCode.isNotOnlyNumbers:
        return "This field should contain only numbers.";
      case ErrorCode.isNotValidEmail:
        return "This field requires a valid email address.";
      case ErrorCode.isNotValidPhoneNumber:
        return "This field requires a valid phone number.";
      case ErrorCode.isNotValidDateTime:
        return "This field requires a valid date and time.";
      case ErrorCode.dateIsLessThanMinAge:
        return "The value should be at least ${error.parameter}.";
      case ErrorCode.dateIsMoreThanMaxAge:
        return "The value should be at most ${error.parameter}.";
      case ErrorCode.numIsLessThanMin:
        return "The value should be at least ${error.parameter}.";
      case ErrorCode.numIsMoreThanMax:
        return "The value should be at most ${error.parameter}.";
      case ErrorCode.boolShouldBeTrue:
        return "This value should be true.";
      case ErrorCode.boolShouldBeFalse:
        return "This value should be false.";
      case ErrorCode.boolAgreeToTerms:
        return "You must agree to the terms and conditions.";
      case ErrorCode.intIsNotValidCreditCard:
        return "This is not a valid credit card number.";
      case ErrorCode.wordCountIsLessThan:
        return "The word count should be at least ${error.parameter}.";
      case ErrorCode.wordCountIsMoreThan:
        return "The word count should be at most ${error.parameter}.";
      case ErrorCode.isNotValidIpAddress:
        return "This field requires a valid IP address.";
      case ErrorCode.isNotValidIpv6Address:
        return "This field requires a valid IPv6 address.";
      case ErrorCode.isNotValidUrl:
        return "This field requires a valid URL.";
      case ErrorCode.isNotEqualTo:
        return "The value should be equal to ${error.parameter}.";
      case ErrorCode.custom:
        return "An error occurred: ${error.parameter ?? 'Unknown error'}";
      default:
        throw ArgumentError('Unsupported error code: ${error.code}');
    }
  }
}
