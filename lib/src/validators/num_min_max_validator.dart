import 'package:form_model/src/enums/error_code.dart';
import 'package:form_model/src/model/form_model_error.dart';
import 'package:form_model/src/model/form_model_validator/form_model_validator.dart';

/// A validator class for validating numeric values within specified minimum and maximum limits.
///
/// This validator implements [FormModelValidator] for string values (`String?`).
/// It attempts to parse the provided string [value] into a numeric type (e.g., `int`, `double`).
/// If parsing is successful, it checks whether the numeric value falls within the specified
/// [min]imum and/or [max]imum limits. If the value is outside these bounds, it returns a [FormModelError]
/// with the appropriate error code.
///
/// This validator is useful in form validation scenarios where input fields are expected
/// to contain numeric values within specific ranges.
final class NumMinMaxValidator implements FormModelValidator<String?> {
  /// The minimum value that the parsed numeric value must exceed.
  final num? min;

  /// The maximum value that the parsed numeric value must not exceed.
  final num? max;

  /// Creates a [NumMinMaxValidator] instance.
  ///
  /// - Parameters:
  ///   - min: The minimum value that the parsed numeric value must exceed. Default is `null`.
  ///   - max: The maximum value that the parsed numeric value must not exceed. Default is `null`.
  const NumMinMaxValidator({
    this.min,
    this.max,
  });

  /// Validates the provided [value] to ensure it represents a numeric value within the specified limits.
  ///
  /// This method attempts to parse the [value] into a numeric type (e.g., `int`, `double`).
  /// If parsing is successful and the numeric value is outside the specified [min] and/or [max] limits,
  /// it returns a [FormModelError] with the appropriate error code.
  ///
  /// - Parameter value: The string value to validate as a numeric value.
  /// - Returns: A [FormModelError] object if the validation fails, otherwise `null`.
  @override
  FormModelError<String?>? validate(String? value) {
    if (value != null) {
      final numValue = num.tryParse(value);
      if (numValue != null && min != null && numValue < min!) {
        return FormModelError(
          code: ErrorCode.numIsLessThanMin,
          value: value,
          parameter: min,
        );
      }
      if (numValue != null && max != null && numValue > max!) {
        return FormModelError(
          code: ErrorCode.numIsMoreThanMax,
          value: value,
          parameter: max,
        );
      }
    }
    return null;
  }
}
