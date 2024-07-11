import 'package:form_model/src/enums/error_code.dart';
import 'package:form_model/src/models/form_model_error.dart';
import 'package:form_model/src/models/form_model_validator/form_model_validator.dart';

/// A validator class for validating a string against a custom regular expression pattern.
///
/// This validator implements [FormModelValidator] for string values (`String?`).
/// It checks if the provided value matches a specified [pattern]. If the value does not
/// match the pattern, it returns a [FormModelError] with the [ErrorCode.didNotMatchPattern]
/// code, indicating a validation failure.
///
/// This validator is useful in form validation scenarios where input fields are expected
/// to conform to a specific custom pattern defined by a regular expression.
final class CustomPatternValidator implements FormModelValidator<String?> {
  /// The regular expression pattern to match against the input value.
  final RegExp pattern;

  /// Creates a [CustomPatternValidator] with the specified [pattern].
  ///
  /// The instance of this validator is typically `const` because it is immutable
  /// and can be reused across multiple form fields.
  ///
  /// - Parameter pattern: The regular expression pattern to match against the input value.
  const CustomPatternValidator({required this.pattern});

  /// Validates the provided [value] against the custom [pattern].
  ///
  /// This method checks if the [value] matches the specified [pattern]. If the [value]
  /// does not match the [pattern], it returns a [FormModelError] with the [ErrorCode.didNotMatchPattern]
  /// code, indicating that the input value does not conform to the expected pattern.
  ///
  /// - Parameter value: The string value to validate.
  /// - Returns: A [FormModelError] object if the validation fails, otherwise `null`.
  @override
  FormModelError<String?>? validate(String? value) {
    if (value != null) {
      if (!pattern.hasMatch(value)) {
        return FormModelError(
            code: ErrorCode.didNotMatchPattern,
            value: value,
            parameter: pattern);
      }
    }
    return null;
  }
}
