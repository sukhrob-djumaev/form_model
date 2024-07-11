import 'package:form_model/src/enums/error_code.dart';
import 'package:form_model/src/models/form_model_error.dart';
import 'package:form_model/src/models/form_model_validator/form_model_validator.dart';

/// A validator class for validating string length equality.
///
/// This validator implements [FormModelValidator] for string values (`String?`).
/// It checks if the length of the provided value matches a specified length.
/// If the length does not match, it returns a [FormModelError] with the [ErrorCode.lengthIsNotEqual]
/// code, indicating a validation failure.
///
/// This validator is useful in form validation scenarios where input fields are expected
/// to have a specific character length.
final class EqualLengthValidator implements FormModelValidator<String?> {
  /// The desired length that the string value should match.
  final int? length;

  /// Creates an [EqualLengthValidator] instance with an optional [length] parameter.
  ///
  /// The instance of this validator is typically `const` because it is immutable
  /// and can be reused across multiple form fields.
  const EqualLengthValidator({
    this.length,
  });

  /// Validates the provided [value] against a specified length.
  ///
  /// This method checks if the length of the [value] matches the [length] parameter.
  ///
  /// - Parameter value: The string value to validate for length equality.
  /// - Returns: A [FormModelError] object if the validation fails, otherwise `null`.
  @override
  FormModelError<String?>? validate(String? value) {
    if (value != null) {
      if (length != null) {
        if (value.length != length!) {
          return FormModelError(
              code: ErrorCode.lengthIsNotEqual,
              value: value,
              parameter: length);
        }
      }
    }
    return null;
  }
}
