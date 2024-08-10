import 'package:form_model/src/errors/form_error_key.dart';
import 'package:form_model/src/validators/validators.dart';

/// An abstract interface class representing a form model.
///
/// The `IFormModel` interface defines a contract for form field models in a
/// robust form validation system. It provides methods and properties to manage
/// form state, perform validations, and handle errors for individual form fields.
///
/// The type parameter `T` represents the type of the form field's value,
/// allowing for type-safe implementations for various data types (e.g., String,
/// int, custom objects).
///
/// Key features:
/// - Value management: Get and set the current value of the form field.
/// - Validation: Check field validity and manage associated validators.
/// - State tracking: Monitor whether the field has been modified.
/// - Error handling: Access validation errors for display or processing.
///
/// Example usage:
/// ```dart
/// class EmailFormModel implements IFormModel<String> {
///   // Implementation details...
/// }
///
/// final emailField = EmailFormModel();
/// emailField.setValue('user@example.com').validate();
/// if (emailField.isValid) {
///   // Proceed with form submission
/// } else {
///   print(emailField.error);
/// }
/// ```
abstract interface class IFormModel<T extends Object> {
  /// Gets the current value of the form model.
  ///
  /// Returns the current value of type `T` if set, or `null` if no value
  /// has been set or if the value has been cleared.
  T? get value;

  /// Determines if the form model is currently valid.
  ///
  /// Returns `true` if the current value passes all associated validators,
  /// `false` otherwise. This should be checked before using the form data.
  bool get isValid;

  /// Determines if the form model has been modified from its initial state.
  ///
  /// Returns `true` if the value has been changed since initialization or
  /// the last reset, `false` otherwise. Useful for tracking user interactions.
  bool get isDirty;

  /// Gets the first error encountered during validation, if any.
  ///
  /// Returns a `FormErrorKey` representing the first validation error,
  /// or `null` if there are no errors. Useful for displaying a single error message.
  FormErrorKey? get error;

  /// Gets the list of all validation errors.
  ///
  /// Returns a list of `FormErrorKey` objects representing all validation
  /// errors for the current value. The list is empty if there are no errors.
  /// Useful for displaying multiple error messages.
  List<FormErrorKey> get errorsList;

  /// Gets the list of validators associated with the form model.
  ///
  /// Returns a list of `IFormModelValidator<T>` objects used to validate
  /// the form field's value.
  List<IFormModelValidator<T>> get validators;

  /// Adds a new validator to the form model.
  ///
  /// Returns an updated form model instance with the new validator added.
  /// This method should not mutate the current instance but return a new one.
  ///
  /// Example:
  /// ```dart
  /// formModel = formModel.addValidator(EmailValidator());
  /// ```
  IFormModel<T> addValidator(IFormModelValidator<T> validator);

  /// Removes an existing validator from the form model.
  ///
  /// Returns an updated form model instance with the specified validator removed.
  /// This method should not mutate the current instance but return a new one.
  ///
  /// Example:
  /// ```dart
  /// formModel = formModel.removeValidator(existingValidator);
  /// ```
  IFormModel removeValidator(IFormModelValidator<T> validator);

  /// Replaces an existing validator in the form model based on a predicate.
  ///
  /// Returns an updated form model instance with the validator replaced.
  /// This method should not mutate the current instance but return a new one.
  ///
  /// Example:
  /// ```dart
  /// formModel = formModel.replaceValidator(
  ///   predicate: (validator) => validator is OldValidator,
  ///   newValidator: NewValidator(),
  /// );
  /// ```
  IFormModel<T> replaceValidator({
    required bool Function(IFormModelValidator<T> validator) predicate,
    required IFormModelValidator<T> newValidator,
  });

  /// Sets a new value for the form model.
  ///
  /// Returns an updated form model instance with the new value set.
  /// This method should not mutate the current instance but return a new one.
  ///
  /// Example:
  /// ```dart
  /// formModel = formModel.setValue('new@email.com');
  /// ```
  IFormModel<T> setValue(T? value);

  /// Validates the form model using the associated validators.
  ///
  /// Triggers the validation process and updates the internal state
  /// to reflect the validation results. Returns an updated form model instance.
  ///
  /// Example:
  /// ```dart
  /// formModel = formModel.validate();
  /// if (formModel.isValid) {
  ///   // Proceed with form submission
  /// }
  /// ```
  IFormModel<T> validate();

  /// Resets the form model to its initial state.
  ///
  /// Clears the current value, resets the dirty state, and clears any
  /// validation errors. Returns an updated form model instance.
  ///
  /// Example:
  /// ```dart
  /// formModel = formModel.reset();
  /// ```
  IFormModel<T> reset();
}
