import 'package:form_model/src/enums/error_code.dart';
import 'package:form_model/src/model/form_model_error.dart';
import 'package:form_model/src/model/form_model_validator/form_model_validator.dart';

/// A validator class for validating phone number formats.
///
/// This validator implements [FormModelValidator] for string values (`String?`).
/// It checks if the provided [value] matches a valid phone number format.
/// The regular expression used ensures the phone number is valid with an optional leading `+`
/// followed by a country code and up to 14 digits.
///
/// This validator is useful in form validation scenarios where input fields are expected
/// to accept phone numbers in a specific format.
final class PhoneNumberValidator implements FormModelValidator<String?> {
  /// Creates a [PhoneNumberValidator] instance.
  const PhoneNumberValidator();

  /// Validates the provided [value] to ensure it matches a valid phone number format.
  ///
  /// This method checks if the [value] matches the regular expression `r'^\+?[1-9]\d{1,14}$'`,
  /// which validates phone numbers with an optional leading `+`, followed by a country code
  /// and up to 14 digits.
  ///
  /// - Parameter value: The string value representing a phone number to validate.
  /// - Returns: A [FormModelError] object if the validation fails (value does not match the phone number format),
  ///   otherwise `null`.
  @override
  FormModelError<String?>? validate(String? value) {
    if (value != null) {
      if (!RegExp(r'^\+?[1-9]\d{1,14}$').hasMatch(value)) {
        return FormModelError(
          code: ErrorCode.isNotValidPhoneNumber,
          value: value,
        );
      }
    }
    return null;
  }
}