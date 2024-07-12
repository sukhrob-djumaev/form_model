import 'package:flutter/foundation.dart';
import 'package:form_model/src/enums/form_model_status.dart';
import 'package:form_model/src/models/form_model/i_form_model.dart';
import 'package:form_model/src/models/form_model_validator/i_form_model_validator.dart';

/// A concrete implementation of the [IFormModel] interface for managing form state and validation.
///
/// The `FormModel` class provides a generic implementation for handling form fields
/// with values of any type `T`. It includes functionality for value management, validation,
/// error handling, and tracking interaction states.
///
/// This class is final and immutable, ensuring that any state changes result in the creation
/// of new instances rather than mutating existing ones.
///
/// [FormModel] implements [BaseFormModel<T?>], allowing it to be used as a form model
/// in various form-related contexts within Flutter applications.
abstract base class BaseFormModel<T extends Object?, E extends Object>
    implements IFormModel<T, E> {
  /// The current value of the form field.
  final T _value;

  /// The current status of the form field, indicating whether it is pure or dirty.
  final FormModelStatus status;

  /// The list of validators attached to the form field for performing validation checks.
  final List<IFormModelValidator<T, E>> _validators;

  final Set<Type> _restrictedValidators;

  /// Constructs a new [FormModel] instance.
  ///
  /// The constructor allows specifying an initial value, a list of validators, and an optional status.
  /// If no validators are provided, an empty list is used by default.
  ///
  /// Parameters:
  /// - [value]: The initial value of the form field (optional).
  /// - [status]: The initial status of the form field, defaulting to [FormModelStatus.pure].
  /// - [validators]: The list of validators to attach to the form field (optional).
  const BaseFormModel(
    T initialValue, {
    this.status = FormModelStatus.pure,
    List<IFormModelValidator<T, E>> validators = const [],
    Set<Type> restrictedValidators = const {},
  })  : _value = initialValue,
        _validators = validators,
        _restrictedValidators = restrictedValidators;

  /// Retrieves the current validation error for the form field.
  ///
  /// If the form field is in a dirty state, it checks each validator for errors
  /// and returns the first encountered error. If no errors are found or the form
  /// field is not dirty, it returns `null`.
  @override
  E? get error {
    if (status == FormModelStatus.dirty) {
      for (final validator in filteredValidators) {
        final error = validator.validate(value);
        if (error != null) {
          return error;
        }
      }
    }
    return null;
  }

  /// Retrieves the current value of the form field.
  @override
  T get value => _value;

  /// Indicates whether the form field is currently considered valid.
  ///
  /// The form field is considered valid if there are no validation errors.
  @override
  bool get isValid => error == null;

  /// Indicates whether the form field has been interacted with (dirty state).
  @override
  bool get isDirty => status == FormModelStatus.dirty;

  /// Resets the form field to its initial state.
  ///
  /// Optionally, a new initial [value] can be provided to reset the form with
  /// a different starting value. Returns a new [FormModel] instance representing
  /// the form in its initial state.
  @override
  BaseFormModel<T, E> reset(ValueGetter<T>? value) =>
      copyWith(status: FormModelStatus.pure, value: value);

  /// Sets a new value to the form field.
  ///
  /// Returns a new [FormModel] instance with the updated value.
  @override
  BaseFormModel<T, E> setValue(T value) => copyWith(value: () => value);

  /// Validates the form field and returns a new form model with updated state.
  ///
  /// Triggers the validation process for the form field, marking it as dirty.
  /// Returns a new [FormModel] instance reflecting the updated state.
  @override
  BaseFormModel<T, E> validate() => copyWith(status: FormModelStatus.dirty);

  /// Adds a validator to the form model.
  ///
  /// Returns a new [FormModel] instance with the added validator included in its list
  /// of validators.
  @override
  BaseFormModel<T, E> switchValidator(Type type, {bool? restrict}) {
    final isRestricted = _restrictedValidators.contains(type);

    restrict = restrict ?? !isRestricted;

    if (restrict) {
      return copyWith(
        restrictedValidators: Set.from(
          _restrictedValidators.where((e) => e != type),
        ),
      );
    } else {
      return copyWith(
        restrictedValidators: {
          ..._restrictedValidators,
          type,
        },
      );
    }
  }

  /// Retrieves a list of all validation errors affecting the form field.
  ///
  /// If the form field is in a dirty state, it collects and returns all validation
  /// errors from the attached validators. If the form field is not dirty, it returns
  /// an empty list.
  @override
  List<E> get errorsList {
    if (status == FormModelStatus.dirty) {
      return filteredValidators.map((e) => e.validate(value)).nonNulls.toList();
    }
    return [];
  }

  /// Retrieves the list of validators attached to the form field.
  @override
  List<IFormModelValidator<T, E>> get validators => _validators;

  List<IFormModelValidator<T, E>> get filteredValidators => _validators
      .map((e) => restrictedValidators.contains(e.runtimeType) ? e : null)
      .nonNulls
      .toList();

  @protected
  Set<Type> get restrictedValidators => _restrictedValidators;

  /// Creates a copy of the current [FormModel] with specified values.
  ///
  /// This method is used internally to create new instances of [FormModel] with updated state.
  /// It ensures immutability by returning new instances instead of modifying existing ones.
  ///
  /// Parameters:
  /// - [value]: The new value to set (optional).
  /// - [status]: The new status to set (optional).
  /// - [validators]: The new list of validators to set (optional).
  ///
  /// Returns:
  /// - A new [FormModel] instance with the specified updates.
  @protected
  BaseFormModel<T, E> copyWith({
    ValueGetter<T>? value,
    FormModelStatus? status,
    List<IFormModelValidator<T, E>>? validators,
    Set<Type>? restrictedValidators,
  });

  /// Compares two [FormModel] instances for equality.
  ///
  /// Returns `true` if both instances have the same value and status.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BaseFormModel<T, E> &&
          runtimeType == other.runtimeType &&
          other.value == value &&
          other.status == status;

  /// Generates a hash code for the [FormModel] instance.
  ///
  /// The hash code is based on the value and status.
  @override
  int get hashCode => Object.hash(value, status);
}
