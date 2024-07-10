import 'package:form_model/src/enums/error_code.dart';
import 'package:form_model/src/models/form_error.dart';
import 'package:form_model/src/validators/base_form_model_validator.dart';

/// A validator class for ensuring that a value is a valid URL.
///
/// This validator implements [BaseFormModelValidator] for values of type `String`.
/// It checks if the provided [value] can be parsed into a valid [Uri] object,
/// indicating that it conforms to the URL format.
///
/// This validator is useful in form validation scenarios where a field should only accept
/// valid URL input.
/// It provides validation errors using [FormError] with [ErrorCode.isNotValidUrl] when
/// the value is not a valid URL.
final class UrlValidator implements BaseFormModelValidator<String?> {
  /// Creates a [UrlValidator] instance.
  const UrlValidator();

  /// Validates the provided [value] to ensure it is a valid URL.
  ///
  /// This method uses [Uri.tryParse] to attempt parsing the [value] into a [Uri] object.
  /// If parsing fails (resulting in `null`), the method returns a [FormError] with
  /// [ErrorCode.isNotValidUrl], indicating that the value is not a valid URL.
  ///
  /// - Parameter value: The string value to validate.
  /// - Returns: A [FormError] object with [ErrorCode.isNotValidUrl] if the validation fails
  ///   (value is not a valid URL), otherwise `null`.
  @override
  FormError<String?>? validate(String? value) {
    if (value != null) {
      if (Uri.tryParse(value) == null) {
        return FormError(
          code: ErrorCode.isNotValidUrl,
          value: value,
        );
      }
    }
    return null;
  }
}
