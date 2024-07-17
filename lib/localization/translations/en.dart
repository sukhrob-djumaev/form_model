import 'package:form_model/form_model.dart';

import '../form_error_text_translations.dart';

class PredefinedFormErrorKeyTranslationsEn implements PredefinedFormErrorKeyTranslations {
  @override
  String translate(PredefinedFormErrorKey errorKey) {
    return switch (errorKey.type) {
      PredefinedFormErrorType.required => 'This field is required.',
      PredefinedFormErrorType.lengthIsLessThanMin => 'The length should be at least ${errorKey.parameter}.',
      PredefinedFormErrorType.lengthIsMoreThanMax => 'The length should be at most ${errorKey.parameter}.',
      PredefinedFormErrorType.lengthIsNotEqual => 'The length should be exactly ${errorKey.parameter}.',
      PredefinedFormErrorType.didNotMatchPattern =>
        'The value did not match the expected pattern: ${errorKey.parameter}.',
      PredefinedFormErrorType.isNotOnlyText => 'This field should contain only alphabetic characters.',
      PredefinedFormErrorType.isNotOnlyNumbers => 'This field should contain only numbers.',
      PredefinedFormErrorType.isNotValidEmail => 'This field requires a valid email address.',
      PredefinedFormErrorType.isNotValidPhoneNumber => 'This field requires a valid phone number.',
      PredefinedFormErrorType.isNotValidDateTime => 'This field requires a valid date and time.',
      PredefinedFormErrorType.dateIsLessThanMinAge => 'The value should be at least ${errorKey.parameter}.',
      PredefinedFormErrorType.dateIsMoreThanMaxAge => 'The value should be at most ${errorKey.parameter}.',
      PredefinedFormErrorType.numIsLessThanMin => 'The value should be at least ${errorKey.parameter}.',
      PredefinedFormErrorType.numIsMoreThanMax => 'The value should be at most ${errorKey.parameter}.',
      PredefinedFormErrorType.boolShouldBeTrue => 'This value should be true.',
      PredefinedFormErrorType.boolShouldBeFalse => 'This value should be false.',
      PredefinedFormErrorType.boolAgreeToTerms => 'You must agree to the terms and conditions.',
      PredefinedFormErrorType.intIsNotValidCreditCard => 'This is not a valid credit card number.',
      PredefinedFormErrorType.wordCountIsLessThan => 'The word count should be at least ${errorKey.parameter}.',
      PredefinedFormErrorType.wordCountIsMoreThan => 'The word count should be at most ${errorKey.parameter}.',
      PredefinedFormErrorType.isNotValidIpAddress => 'This field requires a valid IP address.',
      PredefinedFormErrorType.isNotValidIpv6Address => 'This field requires a valid IPv6 address.',
      PredefinedFormErrorType.isNotValidUrl => 'This field requires a valid URL.',
      PredefinedFormErrorType.isNotEqualTo => 'The value should be equal to ${errorKey.parameter}.',
      PredefinedFormErrorType.passwordsDoNotMatch => 'Passwords do not match.',
      PredefinedFormErrorType.passwordTooShort => 'Password must be at least ${errorKey.parameter} characters long.',
      PredefinedFormErrorType.passwordNoUppercase => 'Password must contain at least one uppercase letter.',
      PredefinedFormErrorType.passwordNoLowercase => 'Password must contain at least one lowercase letter.',
      PredefinedFormErrorType.passwordNoNumber => 'Password must contain at least one number.',
      PredefinedFormErrorType.passwordNoSpecialChar =>
        'Password must contain at least one special character (${errorKey.parameter}).',
    };
  }
}
