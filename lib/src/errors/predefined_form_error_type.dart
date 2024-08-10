/// Represents predefined types of form errors.
///
/// This enum is used to categorize different types of validation errors that
/// a form model can encounter. It provides a standardized set of error types
/// that can be used across different form fields and validation scenarios.
///
/// Using predefined error types allows for:
/// - Consistent error handling across the application
/// - Easier localization of error messages
/// - Clear categorization of different validation failures
///
/// Usage example:
/// ```dart
/// void handleError(PredefinedFormErrorType errorType) {
///   switch (errorType) {
///     case PredefinedFormErrorType.required:
///       print('This field is required');
///       break;
///     case PredefinedFormErrorType.invalidEmail:
///       print('Please enter a valid email address');
///       break;
///     // Handle other cases...
///   }
/// }
/// ```
enum PredefinedFormErrorType {
  /// Indicates that a required field is empty.
  required,

  /// Indicates that the length of the input is less than the minimum allowed length.
  lengthIsLessThanMin,

  /// Indicates that the length of the input is more than the maximum allowed length.
  lengthIsMoreThanMax,

  /// Indicates that the length of the input is not equal to a specified length.
  lengthIsNotEqual,

  /// Indicates that the input does not match a specified pattern.
  didNotMatchPattern,

  /// Indicates that the input contains characters that are not text.
  isNotOnlyText,

  /// Indicates that the input contains characters that are not numbers.
  isNotOnlyNumbers,

  /// Indicates that the input is not a valid email address.
  isNotValidEmail,

  /// Indicates that the input is not a valid phone number.
  isNotValidPhoneNumber,

  /// Indicates that the input is not a valid date and time.
  isNotValidDateTime,

  /// Indicates that the date is less than the minimum allowed age.
  dateIsLessThanMinAge,

  /// Indicates that the date is more than the maximum allowed age.
  dateIsMoreThanMaxAge,

  /// Indicates that the number is less than the minimum allowed value.
  numIsLessThanMin,

  /// Indicates that the number is more than the maximum allowed value.
  numIsMoreThanMax,

  /// Indicates that a boolean value should be true.
  boolShouldBeTrue,

  /// Indicates that a boolean value should be false.
  boolShouldBeFalse,

  /// Indicates that a boolean value should be true as an agreement to terms.
  boolAgreeToTerms,

  /// Indicates that an integer is not a valid credit card number.
  intIsNotValidCreditCard,

  /// Indicates that the number of words is less than the minimum required.
  wordCountIsLessThan,

  /// Indicates that the number of words is more than the maximum allowed.
  wordCountIsMoreThan,

  /// Indicates that the input is not a valid IP address.
  isNotValidIpAddress,

  /// Indicates that the input is not a valid IPv6 address.
  isNotValidIpv6Address,

  /// Indicates that the input is not a valid URL.
  isNotValidUrl,

  /// Indicates that the input is not equal to a specified value.
  isNotEqualTo,

  /// Indicates that the passwords do not match.
  passwordsDoNotMatch,

  /// Indicates that the password is too short.
  passwordTooShort,

  /// Indicates that the password does not contain an uppercase letter.
  passwordNoUppercase,

  /// Indicates that the password does not contain a lowercase letter.
  passwordNoLowercase,

  /// Indicates that the password does not contain a number.
  passwordNoNumber,

  /// Indicates that the password does not contain a special character.
  passwordNoSpecialChar,

  /// Indicates that the input string does not contain a required substring.
  stringDoesNotContain,

  /// Indicates that the input string contains a forbidden substring.
  stringContains,

  /// Indicates that the file type is not allowed.
  invalidFileType,

  /// Indicates that the file size exceeds the allowed limit.
  fileSizeExceedsLimit,
}
