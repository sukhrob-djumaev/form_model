import 'package:form_model/src/enums/error_code.dart';
import 'package:form_model/src/model/form_model_error.dart';
import 'package:form_model/src/model/form_model_validator/form_model_validator.dart';

/// A validator class for validating the length of a string.
///
/// This validator implements [FormModelValidator] for string values (`String?`).
/// It checks if the provided value's length is within the specified minimum and/or maximum limits.
/// If the value's length does not meet the specified constraints, it returns a [FormModelError]
/// with the appropriate error code, indicating a validation failure.
///
/// This validator is useful in form validation scenarios where input fields are expected
/// to have lengths within certain boundaries.
class LengthValidator implements FormModelValidator<String?> {
  /// The minimum length that the string value must have.
  final int? minLength;

  /// The maximum length that the string value must not exceed.
  final int? maxLength;

  /// Creates a [LengthValidator] instance.
  ///
  /// - Parameters:
  ///   - minLength: The minimum length that the string value must have. Default is `null`.
  ///   - maxLength: The maximum length that the string value must not exceed. Default is `null`.
  const LengthValidator({
    this.minLength,
    this.maxLength,
  });

  /// Validates the provided [value] to ensure its length is within the specified limits.
  ///
  /// This method checks if the [value]'s length is greater than or equal to [minLength]
  /// and less than or equal to [maxLength]. If the [value] does not meet these conditions,
  /// it returns a [FormModelError] with the appropriate error code.
  ///
  /// - Parameter value: The string value to validate.
  /// - Returns: A [FormModelError] object if the validation fails, otherwise `null`.
  @override
  FormModelError<String?>? validate(String? value) {
    if (value != null) {
      if (minLength != null && value.length < minLength!) {
        return FormModelError(
          code: ErrorCode.lengthIsLessThanMin,
          value: value,
          parameter: minLength,
        );
      }
      if (maxLength != null && value.length > maxLength!) {
        return FormModelError(
          code: ErrorCode.lengthIsMoreThanMax,
          value: value,
          parameter: maxLength,
        );
      }
    }
    return null;
  }
}
