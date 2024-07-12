import 'package:flutter/foundation.dart';
import 'package:form_model/src/models/form_model_validator/i_form_model_validator.dart';

/// Represents an abstract interface for managing form state and validation in Flutter applications.
///
/// This interface defines the core functionality required to handle form fields,
/// including value management, validation, error handling, and interaction tracking.
///
/// Generics:
/// - `T`: The type of value managed by the form model.
abstract interface class IFormModel<T, E> {
  /// Retrieves the current value of the form field.
  ///
  /// Implementations should return the current value stored in the form model.
  T get value;

  /// Indicates whether the form is currently considered valid.
  ///
  /// Implementations should determine the validity of the form based on its current state.
  bool get isValid;

  /// Indicates whether the form field has been interacted with (dirty state).
  ///
  /// This property should reflect whether the form field has been modified or
  /// interacted with since it was last reset or initialized.
  bool get isDirty;

  /// Retrieves the current validation error for the form field.
  ///
  /// Implementations should return a single [FormModelError] instance representing
  /// the validation error currently affecting the form, if any.
  E? get error;

  /// Retrieves a list of all validation errors affecting the form state.
  ///
  /// Implementations should collect and return all validation errors that are
  /// currently affecting the form's state. This can include errors from multiple
  /// validators attached to the form model.
  List<E> get errorsList;

  /// Retrieves the list of validators attached to the form model.
  ///
  /// Validators are used to perform validation checks on the form field's value.
  /// This property should return a list of [FormModelValidator] instances
  /// that are currently assigned to validate the form field.
  List<IFormModelValidator<T, E>> get validators;

  /// Sets a new value to the form field.
  ///
  /// Implementations should return a new instance of [IFormModel] with the
  /// updated value. This method does not mutate the current instance but instead
  /// creates a new one with the specified value.
  IFormModel<T, E> setValue(T value);

  /// Validates the form field and returns a new form model with updated state.
  ///
  /// Implementations should trigger the validation process for the form field,
  /// updating its state accordingly (e.g., marking it as dirty). The method
  /// should return a new instance of [IFormModel] reflecting the updated state.
  IFormModel<T, E> validate();

  /// Resets the form to its initial state.
  ///
  /// Optionally, a new initial [value] can be provided to reset the form with
  /// a different starting value. Implementations should return a new instance
  /// of [IFormModel] representing the form in its initial state.
  IFormModel<T, E> reset(ValueGetter<T>? value);

  /// Adds a validator to the form model.
  ///
  /// This method should return a new instance of [IFormModel] with the added
  /// validator included in its list of validators. Implementations should ensure
  /// that the new validator is appended to the existing list of validators.
  IFormModel<T, E> switchValidator(Type type, {bool? restrict});
}
