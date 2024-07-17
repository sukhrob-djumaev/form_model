enum PredefinedFormErrorType {
  required,

  lengthIsLessThanMin,

  lengthIsMoreThanMax,

  lengthIsNotEqual,

  didNotMatchPattern,

  isNotOnlyText,

  isNotOnlyNumbers,

  isNotValidEmail,

  isNotValidPhoneNumber,

  isNotValidDateTime,

  dateIsLessThanMinAge,

  dateIsMoreThanMaxAge,

  numIsLessThanMin,

  numIsMoreThanMax,

  boolShouldBeTrue,

  boolShouldBeFalse,

  boolAgreeToTerms,

  intIsNotValidCreditCard,

  wordCountIsLessThan,

  wordCountIsMoreThan,

  isNotValidIpAddress,

  isNotValidIpv6Address,

  isNotValidUrl,

  isNotEqualTo,

  passwordsDoNotMatch,

  passwordTooShort,

  passwordNoUppercase,

  passwordNoLowercase,

  passwordNoNumber,

  passwordNoSpecialChar,
}
