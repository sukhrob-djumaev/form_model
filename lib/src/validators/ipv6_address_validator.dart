import 'package:form_model/src/enums/error_code.dart';
import 'package:form_model/src/models/form_error.dart';
import 'package:form_model/src/validators/base_form_model_validator.dart';

/// A validator class for validating IPv6 addresses.
///
/// This validator implements [BaseFormModelValidator] for string values (`String?`).
/// It checks if the provided value is a valid IPv6 address format using a regular expression.
/// If the value does not match the IPv6 pattern, it returns a [FormError] with the
/// [ErrorCode.isNotValidIpv6Address] code, indicating a validation failure.
///
/// This validator is useful in form validation scenarios where input fields are expected
/// to contain valid IPv6 addresses.
final class Ipv6AddressValidator implements BaseFormModelValidator<String?> {
  /// Creates an [Ipv6AddressValidator] instance.
  ///
  /// The instance of this validator is typically `const` because it is immutable
  /// and can be reused across multiple form fields.
  const Ipv6AddressValidator();

  /// Validates the provided [value] to ensure it is a valid IPv6 address.
  ///
  /// This method checks if the [value] matches the IPv6 address format using a regular expression.
  ///
  /// - Parameter value: The string value to validate as an IPv6 address.
  /// - Returns: A [FormError] object if the validation fails, otherwise `null`.
  @override
  FormError<String?>? validate(String? value) {
    if (value != null) {
      final ipv6Pattern = RegExp(
          r'^(([0-9a-fA-F]{1,4}:){7}([0-9a-fA-F]{1,4}|:))|(([0-9a-fA-F]{1,4}:){6}(:[0-9a-fA-F]{1,4}|((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|(([0-9a-fA-F]{1,4}:){5}(:[0-9a-fA-F]{1,4}|(:[0-9a-fA-F]{1,4}){2})|(([0-9a-fA-F]{1,4}:){4}(:[0-9a-fA-F]{1,4}|(:[0-9a-fA-F]{1,4}){3}))|(([0-9a-fA-F]{1,4}:){3}(:[0-9a-fA-F]{1,4}|(:[0-9a-fA-F]{1,4}){4}))|(([0-9a-fA-F]{1,4}:){2}(:[0-9a-fA-F]{1,4}|(:[0-9a-fA-F]{1,4}){5}))|([0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){6}))|(:((:[0-9a-fA-F]{1,4}){7}|:))))$');
      if (!ipv6Pattern.hasMatch(value)) {
        return FormError(code: ErrorCode.isNotValidIpv6Address, value: value);
      }
    }
    return null;
  }
}
