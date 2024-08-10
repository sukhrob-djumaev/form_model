import 'package:form_model/src/errors/predefined_form_error_type.dart';

/// Represents a key for a form error.
///
/// This is a base class for different types of form error keys. It provides
/// a common type for both predefined and custom error keys, allowing for
/// flexible error handling in form validation scenarios.
///
/// The sealed class ensures that all form error keys are either
/// [PredefinedFormErrorKey] or [CustomFormErrorKey], enabling
/// exhaustive pattern matching when handling errors.
///
/// Usage example:
/// ```dart
/// FormErrorKey handleError(FormErrorKey error) {
///   return switch (error) {
///     PredefinedFormErrorKey(:final type) => handlePredefinedError(type),
///     CustomFormErrorKey(:final key) => handleCustomError(key),
///   };
/// }
/// ```
sealed class FormErrorKey {
  /// Constructs a [FormErrorKey].
  ///
  /// This constructor is `const` to allow for compile-time constant
  /// error keys, which can be beneficial for performance and memory usage.
  const FormErrorKey();
}

/// Represents a predefined form error key.
///
/// This class is used for errors that are predefined and have a specific type
/// and optional parameter. It provides a structured way to represent common
/// validation errors with additional context when needed.
///
/// The [type] field indicates the specific kind of error, while [parameter]
/// can provide additional information about the error (e.g., a minimum length
/// for a "too short" error).
///
/// Usage example:
/// ```dart
/// final lengthError = PredefinedFormErrorKey(
///   PredefinedFormErrorType.lengthIsLessThanMin,
///   5
/// );
/// print(lengthError.type); // PredefinedFormErrorType.lengthIsLessThanMin
/// print(lengthError.parameter); // 5
/// ```
final class PredefinedFormErrorKey extends FormErrorKey {
  /// The type of the predefined form error.
  final PredefinedFormErrorType type;

  /// An optional parameter for the predefined form error.
  ///
  /// This can provide additional context for the error, such as:
  /// - The minimum length for a "too short" error
  /// - The maximum value for a "too large" error
  /// - A pattern that wasn't matched for a "pattern mismatch" error
  final Object? parameter;

  /// Constructs a [PredefinedFormErrorKey] with the specified [type] and optional [parameter].
  const PredefinedFormErrorKey(this.type, [this.parameter]);
}

/// Represents a custom form error key.
///
/// This class is used for custom errors that are defined by a unique string key.
/// It allows for flexible, application-specific error types that aren't covered
/// by the predefined error types.
///
/// Usage example:
/// ```dart
/// final customError = CustomFormErrorKey('invalid_credit_card_number');
/// print(customError.key); // 'invalid_credit_card_number'
/// ```
final class CustomFormErrorKey extends FormErrorKey {
  /// The unique key for the custom form error.
  ///
  /// This should be a descriptive string that identifies the specific error.
  /// It can be used for localization or to provide custom error messages.
  final String key;

  /// Constructs a [CustomFormErrorKey] with the specified [key].
  const CustomFormErrorKey(this.key);
}
