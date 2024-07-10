import 'package:form_model/src/enums/error_code.dart';
import 'package:form_model/src/models/form_error.dart';
import 'package:form_model/src/validators/base_form_model_validator.dart';

/// A final class that implements [BaseFormModelValidator] to validate a boolean value,
/// typically used to confirm agreement to terms and conditions.
///
/// This validator checks if the provided boolean [value] is `false`. If so, it returns
/// a [FormError] indicating the validation failure with the [ErrorCode.boolAgreeToTerms].
///
/// This class is useful in form validation scenarios where a user's agreement to terms
/// and conditions needs to be validated.
final class BoolAgreeToTermsAndConditionsValidator implements BaseFormModelValidator<bool?> {
  /// Creates a [BoolAgreeToTermsAndConditionsValidator].
  ///
  /// This constructor is `const` because instances of this validator are usually
  /// immutable and can be reused across multiple form fields.
  const BoolAgreeToTermsAndConditionsValidator();

  /// Validates the provided boolean [value].
  ///
  /// This method checks if the [value] is `false`. If it is, a [FormError] with the
  /// [ErrorCode.boolAgreeToTerms] code is returned, indicating the validation failure.
  ///
  /// - Parameter value: The boolean value to validate.
  /// - Returns: A [FormError] if the validation fails, otherwise `null`.
  @override
  FormError<bool?>? validate(bool? value) {
    if (!(value ?? false)) {
      return FormError(code: ErrorCode.boolAgreeToTerms, value: value);
    }
    return null;
  }
}
