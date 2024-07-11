import 'package:form_model/src/enums/error_code.dart';
import 'package:form_model/src/models/form_model_error.dart';
import 'package:form_model/src/models/form_model_validator/form_model_validator.dart';

/// A validator class for ensuring that a value is a valid URL.
///
/// This validator implements [FormModelValidator] for values of type `String`.
/// It checks if the provided [value] can be parsed into a valid [Uri] object,
/// indicating that it conforms to the URL format.
///
/// This validator is useful in form validation scenarios where a field should only accept
/// valid URL input.
/// It provides validation errors using [FormModelError] with [ErrorCode.isNotValidUrl] when
/// the value is not a valid URL.
final class UrlValidator implements FormModelValidator<String?> {
  /// Creates a [UrlValidator] instance.
  const UrlValidator();

  /// Validates the provided [value] to ensure it is a valid URL.
  ///
  /// This method uses [Uri.tryParse] to attempt parsing the [value] into a [Uri] object.
  /// If parsing fails (resulting in `null`), the method returns a [FormModelError] with
  /// [ErrorCode.isNotValidUrl], indicating that the value is not a valid URL.
  ///
  /// - Parameter value: The string value to validate.
  /// - Returns: A [FormModelError] object with [ErrorCode.isNotValidUrl] if the validation fails
  ///   (value is not a valid URL), otherwise `null`.
  @override
  FormModelError<String?>? validate(String? value) {
    if (value != null) {
      if (Uri.tryParse(value) == null) {
        return FormModelError(
          code: ErrorCode.isNotValidUrl,
          value: value,
        );
      }
    }
    return null;
  }
}
