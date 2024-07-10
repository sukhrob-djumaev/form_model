import 'package:form_model/src/enums/error_code.dart';
import 'package:form_model/src/models/form_error.dart';
import 'package:form_model/src/validators/base_form_model_validator.dart';

/// A validator class for validating IPv4 addresses.
///
/// This validator implements [BaseFormModelValidator] for string values (`String?`).
/// It checks if the provided value is a valid IPv4 address format using a regular expression.
/// If the value does not match the IPv4 pattern, it returns a [FormError] with the
/// [ErrorCode.isNotValidIpAddress] code, indicating a validation failure.
///
/// This validator is useful in form validation scenarios where input fields are expected
/// to contain valid IPv4 addresses.
final class IpAddressValidator implements BaseFormModelValidator<String?> {
  /// Creates an [IpAddressValidator] instance.
  ///
  /// The instance of this validator is typically `const` because it is immutable
  /// and can be reused across multiple form fields.
  const IpAddressValidator();

  /// Validates the provided [value] to ensure it is a valid IPv4 address.
  ///
  /// This method checks if the [value] matches the IPv4 address format using a regular expression.
  ///
  /// - Parameter value: The string value to validate as an IPv4 address.
  /// - Returns: A [FormError] object if the validation fails, otherwise `null`.
  @override
  FormError<String?>? validate(String? value) {
    if (value != null) {
      final ipv4Pattern = RegExp(
          r'^([01]?\d\d?|2[0-4]\d|25[0-5])\.([01]?\d\d?|2[0-4]\d|25[0-5])\.([01]?\d\d?|2[0-4]\d|25[0-5])\.([01]?\d\d?|2[0-4]\d|25[0-5])$');
      if (!ipv4Pattern.hasMatch(value)) {
        return FormError(code: ErrorCode.isNotValidIpAddress, value: value);
      }
    }

    return null;
  }
}
