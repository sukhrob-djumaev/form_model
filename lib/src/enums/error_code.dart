/// Represents the various error codes that can be encountered during form validation.
///
/// The `ErrorCode` enum defines a comprehensive set of error conditions that can occur when
/// validating form fields. These error codes can be used to identify specific validation issues
/// and provide meaningful feedback to the user.
enum ErrorCode {
  /// The field is required and must not be empty.
  required,

  /// The length of the field value is less than the minimum allowed length.
  lengthIsLessThanMin,

  /// The length of the field value is more than the maximum allowed length.
  lengthIsMoreThanMax,

  /// The length of the field value does not match the required length.
  lengthIsNotEqual,

  /// The field value did not match the required pattern (e.g., regex).
  didNotMatchPattern,

  /// The field value contains characters that are not only text.
  isNotOnlyText,

  /// The field value contains characters that are not only numbers.
  isNotOnlyNumbers,

  /// The field value is not a valid email address.
  isNotValidEmail,

  /// The field value is not a valid phone number.
  isNotValidPhoneNumber,

  /// The field value is not a valid date and time.
  isNotValidDateTime,

  /// The date value is less than the minimum allowed age.
  dateIsLessThanMinAge,

  /// The date value is more than the maximum allowed age.
  dateIsMoreThanMaxAge,

  /// The numeric value is less than the minimum allowed value.
  numIsLessThanMin,

  /// The numeric value is more than the maximum allowed value.
  numIsMoreThanMax,

  /// The boolean value should be true but is not.
  boolShouldBeTrue,

  /// The boolean value should be false but is not.
  boolShouldBeFalse,

  /// The user must agree to the terms but has not.
  boolAgreeToTerms,

  /// The integer value is not a valid credit card number.
  intIsNotValidCreditCard,

  /// The word count of the field value is less than the minimum allowed count.
  wordCountIsLessThan,

  /// The word count of the field value is more than the maximum allowed count.
  wordCountIsMoreThan,

  /// The field value is not a valid IP address.
  isNotValidIpAddress,

  /// The field value is not a valid IPv6 address.
  isNotValidIpv6Address,

  /// The field value is not a valid URL.
  isNotValidUrl,

  /// The field value is not equal to given value.
  isNotEqualTo,

  /// A custom validation error that does not fit into the predefined categories.
  custom
}
