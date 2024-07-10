import 'package:form_model/src/enums/error_code.dart';
import 'package:form_model/src/models/form_error.dart';
import 'package:form_model/src/validators/base_form_model_validator.dart';

/// A custom validator for form fields that allows defining arbitrary validation logic.
///
/// The `CustomValidator` class implements the `BaseFormModelValidator` interface
/// to provide custom validation capabilities for form fields. It takes a function
/// as a parameter during initialization, which performs validation on the input value.
///
/// The validation function should return a map where the key is a locale code
/// (e.g., 'en', 'ru') and the value is the corresponding error message in that locale,
/// indicating validation failure. If the validation function returns `null`,
/// it signifies that no validation errors were found.
///
/// Example usage:
/// ```dart
/// final validator = CustomValidator(
///   validation: (value) {
///     if (value != null && value.contains('\$')) {
///       return {'en': 'Text should not contain dollar sign'};
///     }
///     return null;
///   },
/// );
///
/// final error = validator.validate(inputValue);
/// ```
class CustomValidator implements BaseFormModelValidator<String?> {
  /// The validation function that performs custom validation logic.
  final Map<String, String>? Function(String? value) validation;

  /// Constructs a `CustomValidator` with the specified validation function.
  ///
  /// Parameters:
  /// - [validation]: A function that takes a `String?` value and returns a map where
  ///   the key is a locale code (e.g., 'en', 'ru') and the value is the corresponding
  ///   error message in that locale, or `null` if no validation errors are found.
  const CustomValidator({
    required this.validation,
  });

  @override
  FormError<String?>? validate(String? value) {
    final customValidation = validation(value);
    if (customValidation != null) {
      return FormError(code: ErrorCode.custom, value: value, customErrorText: customValidation);
    }
    return null;
  }
}
