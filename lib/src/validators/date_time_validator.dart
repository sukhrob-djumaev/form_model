import 'package:form_model/src/enums/error_code.dart';
import 'package:form_model/src/models/form_error.dart';
import 'package:form_model/src/validators/base_form_model_validator.dart';

/// A validator class for validating a string representation of a date and time.
///
/// This validator implements [BaseFormModelValidator] for string values (`String?`).
/// It checks if the provided value can be parsed into a valid [DateTime] object.
/// If the value cannot be parsed, it returns a [FormError] with the [ErrorCode.isNotValidDateTime]
/// code, indicating a validation failure.
///
/// This validator is useful in form validation scenarios where input fields are expected
/// to contain valid date and time information in string format.
final class DateTimeValidator implements BaseFormModelValidator<String?> {
  /// Creates a [DateTimeValidator] instance.
  ///
  /// The instance of this validator is typically `const` because it is immutable
  /// and can be reused across multiple form fields.
  const DateTimeValidator();

  /// Validates the provided [value] as a date and time string representation.
  ///
  /// This method attempts to parse the [value] into a [DateTime] object. If the
  /// parsing fails (i.e., [DateTime.tryParse] returns `null`), it indicates
  /// that the input value is not a valid date and time format.
  ///
  /// - Parameter value: The string value to validate as a date and time.
  /// - Returns: A [FormError] object if the validation fails, otherwise `null`.
  @override
  FormError<String?>? validate(String? value) {
    if (value != null) {
      final parsedDate = DateTime.tryParse(value);
      if (parsedDate == null) {
        return FormError(code: ErrorCode.isNotValidDateTime, value: value);
      }
    }
    return null;
  }
}
