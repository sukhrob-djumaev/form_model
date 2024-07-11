import 'package:form_model/src/enums/error_code.dart';
import 'package:form_model/src/models/form_model_error.dart';
import 'package:form_model/src/models/form_model_validator/form_model_validator.dart';

/// A validator class for boolean values that ensures the value is `true`.
///
/// This validator implements [FormModelValidator] for boolean values (`bool?`).
/// It checks if the provided value is `true`. If the value is `true`,
/// the validation passes, returning `null`. If the value is `false` or `null, it returns a
/// [FormModelError] with the [ErrorCode.boolShouldBeTrue] code, indicating a validation failure.
///
/// This validator is useful in scenarios where a boolean input must specifically be `true`,
/// such as validating checkboxes or boolean fields in forms.
final class BoolTrueValidator implements FormModelValidator<bool?> {
  /// Creates a [BoolTrueValidator].
  ///
  /// The instance of this validator is typically `const` because it is immutable
  /// and can be reused across multiple form fields.
  const BoolTrueValidator();

  /// Validates the provided boolean [value].
  ///
  /// This method checks if the [value] is `true`. If it is, the validation succeeds,
  /// and `null` is returned. If the [value] is `false`, a [FormModelError] is returned
  /// with the [ErrorCode.boolShouldBeTrue] code, indicating that the value should
  /// have been `true`.
  ///
  /// - Parameter value: The boolean value to validate.
  /// - Returns: A [FormModelError] object if the validation fails, otherwise `null`.
  @override
  FormModelError<bool?>? validate(bool? value) {
    if (value != true) {
      return FormModelError(code: ErrorCode.boolShouldBeTrue, value: value);
    }
    return null;
  }
}
