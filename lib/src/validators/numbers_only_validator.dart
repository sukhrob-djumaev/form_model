import 'package:form_model/src/enums/error_code.dart';
import 'package:form_model/src/model/form_model_error.dart';
import 'package:form_model/src/model/form_model_validator/form_model_validator.dart';

/// A validator class for validating that a string contains only numeric characters.
///
/// This validator implements [FormModelValidator] for string values (`String?`).
/// It checks if the provided [value] consists entirely of numeric digits (0-9).
/// If the value contains any non-numeric characters, it returns a [FormModelError]
/// with the appropriate error code.
///
/// This validator is useful in form validation scenarios where input fields are expected
/// to accept only numeric input.
final class NumbersOnlyValidator implements FormModelValidator<String?> {
  /// Creates a [NumbersOnlyValidator] instance.
  const NumbersOnlyValidator();

  /// Validates the provided [value] to ensure it contains only numeric characters (0-9).
  ///
  /// This method checks if the [value] matches the regular expression `^[0-9]*$`,
  /// indicating that it contains only numeric digits.
  ///
  /// - Parameter value: The string value to validate as containing only numeric characters.
  /// - Returns: A [FormModelError] object if the validation fails (contains non-numeric characters),
  ///   otherwise `null`.
  @override
  FormModelError<String?>? validate(String? value) {
    if (value != null) {
      if (!RegExp(r'^[0-9]*$').hasMatch(value)) {
        return FormModelError(
          code: ErrorCode.isNotOnlyText,
          value: value,
        );
      }
    }
    return null;
  }
}
