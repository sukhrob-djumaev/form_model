import 'package:form_model/src/enums/error_code.dart';
import 'package:form_model/src/models/form_error.dart';
import 'package:form_model/src/validators/base_form_model_validator.dart';

/// A validator class for boolean values that ensures the value is `false`.
///
/// This validator implements [BaseFormModelValidator] for boolean values (`bool?`).
/// It checks if the provided value is `false`. If the value is `false`,
/// the validation passes, returning `null`. If the value is `null` or `true`, it returns a
/// [FormError] with the [ErrorCode.boolShouldBeFalse] code, indicating a validation failure.
///
/// This class is useful in form validation scenarios where a boolean input must explicitly
/// be `false`.
final class BoolFalseValidator implements BaseFormModelValidator<bool?> {
  /// Creates a [BoolFalseValidator].
  ///
  /// This constructor is `const` because instances of this validator are usually
  /// immutable and can be reused across multiple form fields.
  const BoolFalseValidator();

  /// Validates the provided boolean [value].
  ///
  /// This method checks if the [value] is `false`. If it is, the validation passes
  /// and `null` is returned. If the [value] is `true`, a [FormError] with the
  /// [ErrorCode.boolShouldBeFalse] code is returned, indicating the validation failure.
  ///
  /// - Parameter value: The boolean value to validate.
  /// - Returns: A [FormError] if the validation fails, otherwise `null`.
  @override
  FormError<bool?>? validate(bool? value) {
    if (value == null || value == true) {
      return FormError(code: ErrorCode.boolShouldBeFalse, value: value);
    }
    return null;
  }
}
