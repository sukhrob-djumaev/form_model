import 'package:form_model/src/enums/error_code.dart';
import 'package:form_model/src/model/form_model_error.dart';
import 'package:form_model/src/model/form_model_validator/form_model_validator.dart';

/// A validator class for validating email addresses.
///
/// This validator implements [FormModelValidator] for string values (`String?`).
/// It checks if the provided value matches a valid email address format using a regular expression.
/// If the value does not match the expected format, it returns a [FormModelError] with the [ErrorCode.isNotValidEmail]
/// code, indicating a validation failure.
///
/// This validator is useful in form validation scenarios where input fields are expected
/// to contain valid email addresses.
final class EmailValidator implements FormModelValidator<String?> {
  /// Creates an [EmailValidator] instance.
  ///
  /// The instance of this validator is typically `const` because it is immutable
  /// and can be reused across multiple form fields.
  const EmailValidator();

  /// Validates the provided [value] as an email address.
  ///
  /// This method uses a regular expression to check if the [value] matches the
  /// standard format of an email address.
  ///
  /// - Parameter value: The string value to validate as an email address.
  /// - Returns: A [FormModelError] object if the validation fails, otherwise `null`.
  @override
  FormModelError<String?>? validate(String? value) {
    if (value != null) {
      if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
          .hasMatch(value)) {
        return FormModelError(code: ErrorCode.isNotValidEmail, value: value);
      }
    }
    return null;
  }
}
