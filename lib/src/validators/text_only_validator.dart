import 'package:form_model/src/enums/error_code.dart';
import 'package:form_model/src/models/form_model_error.dart';
import 'package:form_model/src/models/form_model_validator/form_model_validator.dart';

/// A validator class for ensuring that a value contains only alphabetic characters.
///
/// This validator implements [FormModelValidator] for values of type `String`.
/// It checks if the provided [value] consists exclusively of alphabetic characters
/// using a regular expression.
///
/// This validator is useful in form validation scenarios where a field should only accept
/// alphabetic input.
/// It provides validation errors using [FormModelError] with [ErrorCode.isNotOnlyText] when
/// the value contains non-alphabetic characters.
final class TextOnlyValidator implements FormModelValidator<String?> {
  /// Creates a [TextOnlyValidator] instance.
  const TextOnlyValidator();

  /// Validates the provided [value] to ensure it contains only alphabetic characters.
  ///
  /// This method uses a regular expression (`RegExp(r'^[a-zA-Z]*$')`) to check if the [value]
  /// contains only letters (both uppercase and lowercase).
  ///
  /// - Parameter value: The string value to validate.
  /// - Returns: A [FormModelError] object with [ErrorCode.isNotOnlyText] if the validation fails
  ///   (value contains non-alphabetic characters), otherwise `null`.
  @override
  FormModelError<String?>? validate(String? value) {
    if (value != null) {
      if (!RegExp(r'^[a-zA-Z]*$').hasMatch(value)) {
        return FormModelError(
          code: ErrorCode.isNotOnlyText,
          value: value,
        );
      }
    }
    return null;
  }
}
