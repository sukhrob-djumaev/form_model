import 'package:form_model/src/models/form_error.dart';

/// An abstract interface class representing a base validator for form models.
///
/// This interface defines a contract for implementing validators that can validate
/// values of type `T` and return a [FormError] if the value is invalid. Concrete
/// implementations should provide specific validation logic.
abstract interface class BaseFormModelValidator<T> {
  /// Validates the given [value].
  ///
  /// This method should be implemented by concrete validators to provide specific
  /// validation logic. If the [value] is invalid, it should return a [FormError].
  /// If the [value] is valid, it should return `null`.
  ///
  /// - Parameter value: The value to be validated.
  /// - Returns: A [FormError] if the value is invalid, otherwise `null`.
  FormError<T?>? validate(T? value);
}
