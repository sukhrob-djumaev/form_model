import 'package:flutter/foundation.dart';
import 'package:form_model/src/models/form_model_status.dart';
import 'package:form_model/src/models/i_form_model.dart';
import 'package:form_model/src/errors/form_error_key.dart';
import 'package:form_model/src/validators/validators.dart';

/// Represents a form model that holds a value, status, and a list of validators.
///
/// The `FormModel` class is a concrete implementation of the `IFormModel` interface.
/// It manages the state of a form field, including its value, validation status,
/// and any associated errors.
///
/// Key features:
/// - Immutable state management: Each operation returns a new instance.
/// - Flexible validation: Supports multiple validators per field.
/// - Error tracking: Provides access to the first error or all errors.
/// - Status tracking: Distinguishes between 'pure' (untouched) and 'dirty' (modified) states.
///
/// Example usage:
/// ```dart
/// final emailModel = FormModel<String>(
///   validators: [RequiredValidator(), EmailValidator()],
/// );
///
/// var updatedModel = emailModel.setValue('user@example.com').validate();
/// if (updatedModel.isValid) {
///   print('Email is valid: ${updatedModel.value}');
/// } else {
///   print('Validation error: ${updatedModel.error}');
/// }
/// ```
final class FormModel<T extends Object> implements IFormModel<T> {
  /// The current value of the form model.
  final T? _value;

  /// The current status of the form model, indicating whether it is pure or dirty.
  final FormModelStatus _status;

  /// A list of validators used to validate the form model's value.
  final List<IFormModelValidator<T>> _validators;

  /// Creates a new instance of [FormModel].
  ///
  /// - [value]: The initial value of the form model.
  /// - [validators]: A list of validators to be applied to the value.
  /// - [status]: The initial status of the form model (default is [FormModelStatus.pure]).
  ///
  /// Example:
  /// ```dart
  /// final nameModel = FormModel<String>(
  ///   value: 'John Doe',
  ///   validators: [RequiredValidator(), MinLengthValidator(3)],
  /// );
  /// ```
  const FormModel({
    T? value,
    List<IFormModelValidator<T>>? validators,
    FormModelStatus status = FormModelStatus.pure,
  })  : _value = value,
        _status = status,
        _validators = validators ?? const [];

  /// Gets the first validation error key for the current value, or null if there are no errors.
  ///
  /// This method runs all validators on the current value and returns the first error key it finds.
  /// It only performs validation if the model's status is [FormModelStatus.dirty].
  ///
  /// Returns a [FormErrorKey] if a validation error is found, null otherwise.
  @override
  FormErrorKey? get error {
    if (_status == FormModelStatus.dirty) {
      for (final validator in _validators) {
        final errorKey = validator.validate(value);
        if (errorKey != null) {
          return errorKey;
        }
      }
    }
    return null;
  }

  /// Gets a list of all validation error keys for the current value.
  ///
  /// This method runs all validators on the current value and returns a list of all error keys found.
  /// It only performs validation if the model's status is [FormModelStatus.dirty].
  ///
  /// Returns a list of [FormErrorKey] objects. The list is empty if there are no errors or if the model is pure.
  @override
  List<FormErrorKey> get errorsList {
    if (_status == FormModelStatus.dirty) {
      return _validators
          .map((validator) => validator.validate(value))
          .nonNulls
          .toList();
    }
    return [];
  }

  /// Gets the current value of the form model.
  @override
  T? get value => _value;

  /// Indicates whether the current value is valid.
  ///
  /// This property is true if there are no validation errors, and false otherwise.
  /// It's a convenient way to check if the form field is in a valid state.
  @override
  bool get isValid => error == null;

  /// Indicates whether the form model has been modified.
  ///
  /// This property is true if the form model's status is [FormModelStatus.dirty],
  /// indicating that the value has been changed since initialization or the last reset.
  @override
  bool get isDirty => _status == FormModelStatus.dirty;

  /// Gets the list of validators used to validate the form model's value.
  @override
  List<IFormModelValidator<T>> get validators => _validators;

  /// Adds a validator to the list of validators.
  ///
  /// Returns a new instance of [FormModel] with the updated list of validators.
  ///
  /// Example:
  /// ```dart
  /// final updatedModel = model.addValidator(CustomValidator());
  /// ```
  @override
  FormModel<T> addValidator(IFormModelValidator<T> validator) {
    final updatedValidators = List<IFormModelValidator<T>>.from(_validators)
      ..add(validator);
    return _copyWith(validators: updatedValidators);
  }

  /// Removes a validator from the list of validators.
  ///
  /// Returns a new instance of [FormModel] with the updated list of validators.
  ///
  /// Example:
  /// ```dart
  /// final updatedModel = model.removeValidator(existingValidator);
  /// ```
  @override
  FormModel removeValidator(IFormModelValidator<T> validator) {
    final updatedValidators = List<IFormModelValidator<T>>.from(_validators)
      ..remove(validator);
    return _copyWith(validators: updatedValidators);
  }

  /// Replaces a validator in the list of validators.
  ///
  /// Returns a new instance of [FormModel] with the updated list of validators.
  ///
  /// Example:
  /// ```dart
  /// final updatedModel = model.replaceValidator(
  ///   predicate: (validator) => validator is OldValidator,
  ///   newValidator: NewValidator(),
  /// );
  /// ```
  @override
  FormModel<T> replaceValidator({
    required bool Function(IFormModelValidator<T> validator) predicate,
    required IFormModelValidator<T> newValidator,
  }) {
    final updatedValidators = _validators.map((validator) {
      return predicate(validator) ? newValidator : validator;
    }).toList();

    return _copyWith(validators: updatedValidators);
  }

  /// Resets the form model to its initial, unmodified state.
  ///
  /// Returns a new instance of [FormModel] with the status set to [FormModelStatus.pure].
  ///
  /// Example:
  /// ```dart
  /// final resetModel = model.reset();
  /// ```
  @override
  FormModel<T> reset() => _copyWith(status: FormModelStatus.pure);

  /// Sets a new value for the form model.
  ///
  /// Returns a new instance of [FormModel] with the updated value.
  ///
  /// Example:
  /// ```dart
  /// final updatedModel = model.setValue('New Value');
  /// ```
  @override
  FormModel<T> setValue(T? value) => _copyWith(value: value);

  /// Validates the current value of the form model.
  ///
  /// This method sets the status of the form model to [FormModelStatus.dirty]
  /// and triggers validation. Returns a new instance of [FormModel] with the updated status.
  ///
  /// Example:
  /// ```dart
  /// final validatedModel = model.validate();
  /// if (validatedModel.isValid) {
  ///   // Proceed with form submission
  /// }
  /// ```
  @override
  FormModel<T> validate() => _copyWith(status: FormModelStatus.dirty);

  /// Creates a copy of the current form model with optional updated values.
  ///
  /// This is an internal method used to create new instances of [FormModel]
  /// with modified properties while maintaining immutability.
  FormModel<T> _copyWith({
    T? value,
    FormModelStatus? status,
    List<IFormModelValidator<T>>? validators,
  }) {
    return FormModel<T>(
      value: value ?? _value,
      validators: validators ?? _validators,
      status: status ?? _status,
    );
  }

  /// Checks if the current instance is equal to another object.
  ///
  /// Two [FormModel] instances are considered equal if they have the same
  /// value, status, and list of validators.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FormModel &&
          runtimeType == other.runtimeType &&
          _value == other._value &&
          _status == other._status &&
          listEquals(
            _validators,
            other._validators,
          ));

  /// Gets the hash code of the current instance.
  ///
  /// The hash code is based on the value, status, and validators of the form model.
  @override
  int get hashCode => Object.hash(_value, _status, Object.hashAll(_validators));
}

// typedef StringFormModel = FormModel<String>;
