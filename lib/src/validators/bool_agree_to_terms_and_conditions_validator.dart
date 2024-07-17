import 'package:form_model/src/enums/error_code.dart';
import 'package:form_model/src/model/form_model_error.dart';
import 'package:form_model/src/model/form_model_validator/form_model_validator.dart';

/// A final class that implements [FormModelValidator] to validate a boolean value,
/// typically used to confirm agreement to terms and conditions.
///
/// This validator checks if the provided boolean [value] is `false`. If so, it returns
/// a [FormModelError] indicating the validation failure with the [ErrorCode.boolAgreeToTerms].
///
/// This class is useful in form validation scenarios where a user's agreement to terms
/// and conditions needs to be validated.
final class BoolAgreeToTermsAndConditionsValidator
    implements FormModelValidator<bool?> {
  /// Creates a [BoolAgreeToTermsAndConditionsValidator].
  ///
  /// This constructor is `const` because instances of this validator are usually
  /// immutable and can be reused across multiple form fields.
  const BoolAgreeToTermsAndConditionsValidator();

  /// Validates the provided boolean [value].
  ///
  /// This method checks if the [value] is `false`. If it is, a [FormModelError] with the
  /// [ErrorCode.boolAgreeToTerms] code is returned, indicating the validation failure.
  ///
  /// - Parameter value: The boolean value to validate.
  /// - Returns: A [FormModelError] if the validation fails, otherwise `null`.
  @override
  FormModelError<bool?>? validate(bool? value) {
    if (!(value ?? false)) {
      return FormModelError(code: ErrorCode.boolAgreeToTerms, value: value);
    }
    return null;
  }
}
