import 'package:form_model/src/enums/error_code.dart';
import 'package:form_model/src/models/form_error.dart';
import 'package:form_model/src/validators/base_form_model_validator.dart';

/// A validator class for ensuring a value is required and not empty.
///
/// This validator implements [BaseFormModelValidator] for values of type `T`.
/// It checks if the provided [value] is not null and, if the value is a string,
/// it also ensures that the string is not empty.
///
/// This validator is useful in form validation scenarios where certain fields are mandatory.
/// It provides validation errors using [FormError] with [ErrorCode.required] when the value
/// is null or an empty string.
final class RequiredValidator<T> implements BaseFormModelValidator<T> {
  /// Creates a [RequiredValidator] instance.
  const RequiredValidator();

  /// Validates the provided [value] to ensure it is not null and, if it's a string,
  /// that it is not empty.
  ///
  /// This method checks if the [value] is null or, if it's a string, whether the string
  /// is empty (`value.isEmpty`).
  ///
  /// - Parameter value: The value to validate, which can be of any type `T`.
  /// - Returns: A [FormError] object with [ErrorCode.required] if the validation fails
  ///   (value is null or an empty string), otherwise `null`.
  @override
  FormError<T?>? validate(T? value) {
    if (value == null || (value is String && value.isEmpty)) {
      return FormError(
        code: ErrorCode.required,
        value: value,
      );
    }
    return null;
  }
}
