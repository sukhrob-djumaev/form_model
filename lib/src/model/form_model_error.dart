import 'package:form_model/src/enums/error_code.dart';

/// Represents an error encountered during form validation.
///
/// The `FormModelError` class encapsulates details about an error that occurs when
/// validating a form field. It includes information such as the error code,
/// the value that caused the error, any additional parameter related to the error,
/// and localized custom error text message.
///
/// This class is generic, allowing the error to be associated with values of any type `T`.
final class FormModelError<T> {
  /// The code representing the type of error.
  ///
  /// This code is used to identify the specific error condition.
  final ErrorCode code;

  /// The value that caused the error.
  ///
  /// This value is optional and can provide additional context about the error.
  final T? value;

  /// An optional parameter providing additional information about the error.
  ///
  /// This parameter can be used to supply any extra data that might be relevant
  /// for understanding or resolving the error.
  final Object? parameter;

  /// A map providing custom error text for localized messages.
  ///
  /// This map is used when [code] is [ErrorCode.custom] to display
  /// localized custom error text based on the error context.
  ///
  /// The map key is the locale code (e.g., 'en', 'ru').
  /// The map value is the corresponding error message.
  final Map<String, String>? customErrorText;

  /// Constructs a new [FormModelError] instance.
  ///
  /// The constructor requires an [ErrorCode] and optionally allows specifying
  /// the value that caused the error and an additional parameter.
  ///
  /// Parameters:
  /// - [code]: The code representing the type of error (required).
  /// - [value]: The value that caused the error (optional).
  /// - [parameter]: Additional information about the error (optional).
  /// - [customErrorText]: Custom error text for localized messages (optional).
  FormModelError({
    required this.code,
    this.value,
    this.parameter,
    this.customErrorText,
  });

  /// Compares two [FormModelError] instances for equality.
  ///
  /// Returns `true` if both instances have the same error code, value, and parameter.
  /// This method allows for meaningful comparison of [FormModelError] objects.
  @override
  bool operator ==(covariant FormModelError<T> other) {
    if (identical(this, other)) return true;

    return other.code == code &&
        other.value == value &&
        parameter == other.parameter &&
        customErrorText == other.customErrorText;
  }

  /// Generates a hash code for the [FormModelError] instance.
  ///
  /// The hash code is computed based on the error code, value, and parameter.
  /// This method ensures that [FormModelError] instances can be used effectively in hash-based collections.
  @override
  int get hashCode =>
      code.hashCode ^
      value.hashCode ^
      parameter.hashCode ^
      customErrorText.hashCode;
}
