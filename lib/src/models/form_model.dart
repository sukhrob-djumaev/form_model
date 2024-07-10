import 'package:flutter/foundation.dart';
import 'package:form_model/src/enums/form_status.dart';
import 'package:form_model/src/models/base_form_model.dart';
import 'package:form_model/src/models/form_error.dart';
import 'package:form_model/src/validators/base_form_model_validator.dart';

/// A concrete implementation of the [BaseFormModel] interface for managing form state and validation.
///
/// The `FormModel` class provides a specific implementation for handling form fields
/// with `String?` values. It includes functionality for value management, validation,
/// error handling, and tracking interaction states.
///
/// This class is final and immutable, ensuring that any state changes result in the creation
/// of new instances rather than mutating existing ones.
///
/// [FormModel] implements [BaseFormModel<String?>], allowing it to be used as a form model
/// in various form-related contexts within Flutter applications.
final class FormModel implements BaseFormModel<String?> {
  /// The current value of the form field.
  final String? _value;

  /// The current status of the form field, indicating whether it is pure or dirty.
  final FormStatus status;

  /// The list of validators attached to the form field for performing validation checks.
  final List<BaseFormModelValidator<String?>> _validators;

  /// Constructs a new [FormModel] instance.
  ///
  /// The constructor allows specifying an initial value, a list of validators, and an optional status.
  /// If no validators are provided, an empty list is used by default.
  ///
  /// Parameters:
  /// - [value]: The initial value of the form field (optional).
  /// - [validators]: The list of validators to attach to the form field (optional).
  /// - [status]: The initial status of the form field, defaulting to [FormStatus.pure].
  const FormModel({
    String? value,
    List<BaseFormModelValidator<String?>>? validators,
    this.status = FormStatus.pure,
  })  : _value = value,
        _validators = validators ?? const [];

  /// Retrieves the current validation error for the form field.
  ///
  /// If the form field is in a dirty state, it checks each validator for errors
  /// and returns the first encountered error. If no errors are found or the form
  /// field is not dirty, it returns `null`.
  @override
  FormError<String?>? get error {
    if (status == FormStatus.dirty) {
      for (final validator in _validators) {
        final error = validator.validate(value);
        if (error != null) {
          return error;
        }
      }
    }
    return null;
  }

  /// Retrieves a list of all validation errors affecting the form field.
  ///
  /// If the form field is in a dirty state, it collects and returns all validation
  /// errors from the attached validators. If the form field is not dirty, it returns
  /// an empty list.
  @override
  List<FormError<String?>> get errorsList {
    if (status == FormStatus.dirty) {
      return validators.map((e) => e.validate(value)).nonNulls.toList();
    }
    return [];
  }

  /// Retrieves the list of validators attached to the form field.
  @override
  List<BaseFormModelValidator<String?>> get validators => _validators;

  /// Retrieves the current value of the form field.
  @override
  String? get value => _value;

  /// Indicates whether the form field is currently considered valid.
  ///
  /// The form field is considered valid if there are no validation errors.
  @override
  bool get isValid => error == null;

  /// Indicates whether the form field has been interacted with (dirty state).
  @override
  bool get isDirty => status == FormStatus.dirty;

  /// Resets the form field to its initial state.
  ///
  /// Optionally, a new initial [value] can be provided to reset the form with
  /// a different starting value. Returns a new [FormModel] instance representing
  /// the form in its initial state.
  @override
  FormModel reset(String? value) => _copyWith(status: FormStatus.pure, value: value);

  /// Sets a new value to the form field.
  ///
  /// Returns a new [FormModel] instance with the updated value.
  @override
  FormModel setValue(String? value) => _copyWith(value: value);

  /// Validates the form field and returns a new form model with updated state.
  ///
  /// Triggers the validation process for the form field, marking it as dirty.
  /// Returns a new [FormModel] instance reflecting the updated state.
  @override
  FormModel validate() => _copyWith(status: FormStatus.dirty);

  /// Adds a validator to the form model.
  ///
  /// Returns a new [FormModel] instance with the added validator included in its list
  /// of validators.
  @override
  FormModel addValidator(BaseFormModelValidator<String?> validator) {
    final updatedValidators = List<BaseFormModelValidator<String?>>.from(validators)..add(validator);
    return _copyWith(validators: updatedValidators);
  }

  /// Removes a validator from the form model.
  ///
  /// Returns a new [FormModel] instance with the specified validator removed from its
  /// list of validators. If the validator is not found, returns the current instance unchanged.
  @override
  FormModel removeValidator(BaseFormModelValidator<String?> validator) {
    final updatedValidators = List<BaseFormModelValidator<String?>>.from(validators)..remove(validator);
    return _copyWith(validators: updatedValidators);
  }

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
  FormModel _copyWith({
    String? value,
    FormStatus? status,
    List<BaseFormModelValidator<String?>>? validators,
  }) {
    return FormModel(
      value: value ?? this.value,
      status: status ?? this.status,
      validators: validators ?? this.validators,
    );
  }

  /// Compares two [FormModel] instances for equality.
  ///
  /// Returns `true` if both instances have the same value, status, and list of validators.
  @override
  bool operator ==(Object other) =>
      other is FormModel && other.value == value && other.status == status && listEquals(other.validators, validators);

  /// Generates a hash code for the [FormModel] instance.
  ///
  /// The hash code is based on the value, status, and list of validators.
  @override
  int get hashCode => Object.hash(value, status, validators);
}
