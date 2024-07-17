import 'package:form_model/src/enums/error_code.dart';
import 'package:form_model/src/model/form_model_error.dart';
import 'package:form_model/src/model/form_model_validator/form_model_validator.dart';

/// A validator class for validating credit card numbers using the Luhn algorithm.
///
/// This validator implements [FormModelValidator] for string values (`String?`).
/// It checks if the provided value passes the Luhn algorithm test for credit card numbers.
/// If the value is not null and fails the Luhn check, it returns a [FormModelError] with
/// the [ErrorCode.intIsNotValidCreditCard] code, indicating a validation failure.
///
/// The Luhn algorithm verifies the integrity of a variety of identification numbers,
/// including credit card numbers, and is commonly used for validating numeric data.
///
/// This validator is useful in form validation scenarios where input fields are expected
/// to contain valid credit card numbers.
final class CreditCardValidator implements FormModelValidator<String?> {
  /// Creates a [CreditCardValidator].
  ///
  /// The instance of this validator is typically `const` because it is immutable
  /// and can be reused across multiple form fields.
  const CreditCardValidator();

  /// Validates the provided credit card [value] using the Luhn algorithm.
  ///
  /// This method checks if the [value] passes the Luhn algorithm for credit card numbers.
  /// If the [value] is null or passes the Luhn check, the validation succeeds, and `null`
  /// is returned. If the [value] fails the Luhn check, a [FormModelError] is returned with
  /// the [ErrorCode.intIsNotValidCreditCard] code, indicating that the value does not
  /// represent a valid credit card number.
  ///
  /// - Parameter value: The credit card number string to validate.
  /// - Returns: A [FormModelError] object if the validation fails, otherwise `null`.
  @override
  FormModelError<String?>? validate(String? value) {
    if (value != null) {
      if (!_luhnCheck(value)) {
        return FormModelError(
            code: ErrorCode.intIsNotValidCreditCard, value: value);
      }
    }
    return null;
  }

  /// Performs the Luhn algorithm check on the provided credit card [number].
  ///
  /// The Luhn algorithm is used to validate various identification numbers, including
  /// credit card numbers, by verifying their integrity through a series of steps.
  ///
  /// - Parameter number: The credit card number string to check.
  /// - Returns: `true` if the number passes the Luhn algorithm check, `false` otherwise.
  bool _luhnCheck(String number) {
    int sum = 0;
    bool alternate = false;
    for (int i = number.length - 1; i >= 0; i--) {
      int n = int.parse(number[i]);
      if (alternate) {
        n *= 2;
        if (n > 9) {
          n -= 9;
        }
      }
      sum += n;
      alternate = !alternate;
    }
    return sum % 10 == 0;
  }
}
