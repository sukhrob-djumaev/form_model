import 'package:form_model/src/enums/error_code.dart';
import 'package:form_model/src/models/form_error.dart';
import 'package:form_model/src/validators/base_form_model_validator.dart';

/// A validator class for validating that a string contains only numeric characters.
///
/// This validator implements [BaseFormModelValidator] for string values (`String?`).
/// It checks if the provided [value] consists entirely of numeric digits (0-9).
/// If the value contains any non-numeric characters, it returns a [FormError]
/// with the appropriate error code.
///
/// This validator is useful in form validation scenarios where input fields are expected
/// to accept only numeric input.
final class NumbersOnlyValidator implements BaseFormModelValidator<String?> {
  /// Creates a [NumbersOnlyValidator] instance.
  const NumbersOnlyValidator();

  /// Validates the provided [value] to ensure it contains only numeric characters (0-9).
  ///
  /// This method checks if the [value] matches the regular expression `^[0-9]*$`,
  /// indicating that it contains only numeric digits.
  ///
  /// - Parameter value: The string value to validate as containing only numeric characters.
  /// - Returns: A [FormError] object if the validation fails (contains non-numeric characters),
  ///   otherwise `null`.
  @override
  FormError<String?>? validate(String? value) {
    if (value != null) {
      if (!RegExp(r'^[0-9]*$').hasMatch(value)) {
        return FormError(
          code: ErrorCode.isNotOnlyText,
          value: value,
        );
      }
    }
    return null;
  }
}
