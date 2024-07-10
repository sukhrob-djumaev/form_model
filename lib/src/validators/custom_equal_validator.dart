import 'package:form_model/src/enums/error_code.dart';
import 'package:form_model/src/models/form_error.dart';
import 'package:form_model/src/validators/base_form_model_validator.dart';

/// A custom validator that checks if a form field's value is equal to a specified value.
///
/// The `CustomEqualValidator<T>` class provides a specific implementation of the
/// `BaseFormModelValidator<T?>` interface, designed to validate whether the form field's
/// value matches a pre-defined value. If the value does not match, it returns a
/// `FormError` indicating the mismatch.
///
/// This class is generic and can be used with any data type `T`. It is also immutable,
/// ensuring that any validation configuration remains unchanged throughout its usage.
final class CustomEqualValidator<T> implements BaseFormModelValidator<T?> {
  /// The value that the form field's value should be equal to.
  final T equalValue;

  /// Constructs a new [CustomEqualValidator] instance.
  ///
  /// The constructor requires an [equalValue] which the form field's value will be
  /// compared against during validation.
  ///
  /// Parameters:
  /// - [equalValue]: The value that the form field's value should be equal to.
  const CustomEqualValidator({required this.equalValue});

  /// Validates the form field's value.
  ///
  /// This method checks if the form field's value is equal to the specified [equalValue].
  /// If the value is not equal, it returns a `FormError` with an error code of
  /// `ErrorCode.isNotEqualTo` and the expected value as the parameter. If the value
  /// is equal or the form field's value is `null`, it returns `null`.
  ///
  /// Parameters:
  /// - [value]: The form field's current value to be validated.
  ///
  /// Returns:
  /// - A `FormError` if the value does not match the expected [equalValue], otherwise `null`.
  @override
  FormError<T?>? validate(T? value) {
    if (value != null) {
      if (value != equalValue) {
        return FormError(code: ErrorCode.isNotEqualTo, parameter: equalValue);
      }
    }
    return null;
  }
}
