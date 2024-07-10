import 'package:form_model/src/enums/form_status.dart';
import 'package:form_model/src/models/base_form_model.dart';
import 'package:form_model/src/models/form_error.dart';
import 'package:form_model/src/validators/base_form_model_validator.dart';

/// A concrete implementation of the [BaseFormModel] interface for managing form state and validation.
///
/// The `FormModelCustom` class provides a generic implementation for handling form fields
/// with values of any type `T`. It includes functionality for value management, validation,
/// error handling, and tracking interaction states.
///
/// This class is final and immutable, ensuring that any state changes result in the creation
/// of new instances rather than mutating existing ones.
///
/// [FormModelCustom] implements [BaseFormModel<T?>], allowing it to be used as a form model
/// in various form-related contexts within Flutter applications.
final class FormModelCustom<T> implements BaseFormModel<T?> {
  /// The current value of the form field.
  final T? _value;

  /// The current status of the form field, indicating whether it is pure or dirty.
  final FormStatus status;

  /// The list of validators attached to the form field for performing validation checks.
  final List<BaseFormModelValidator<T?>> _validators;

  /// Constructs a new [FormModelCustom] instance.
  ///
  /// The constructor allows specifying an initial value, a list of validators, and an optional status.
  /// If no validators are provided, an empty list is used by default.
  ///
  /// Parameters:
  /// - [value]: The initial value of the form field (optional).
  /// - [status]: The initial status of the form field, defaulting to [FormStatus.pure].
  /// - [validators]: The list of validators to attach to the form field (optional).
  const FormModelCustom({
    T? value,
    this.status = FormStatus.pure,
    List<BaseFormModelValidator<T?>>? validators,
  })  : _value = value,
        _validators = validators ?? const [];

  /// Retrieves the current validation error for the form field.
  ///
  /// If the form field is in a dirty state, it checks each validator for errors
  /// and returns the first encountered error. If no errors are found or the form
  /// field is not dirty, it returns `null`.
  @override
  FormError<T?>? get error {
    if (status == FormStatus.dirty) {
      for (final validator in validators) {
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
  T? get value => _value;

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
  /// a different starting value. Returns a new [FormModelCustom] instance representing
  /// the form in its initial state.
  @override
  FormModelCustom<T> reset(T? value) => _copyWith(status: FormStatus.pure, value: value);

  /// Sets a new value to the form field.
  ///
  /// Returns a new [FormModelCustom] instance with the updated value.
  @override
  FormModelCustom<T> setValue(T? value) => _copyWith(value: value);

  /// Validates the form field and returns a new form model with updated state.
  ///
  /// Triggers the validation process for the form field, marking it as dirty.
  /// Returns a new [FormModelCustom] instance reflecting the updated state.
  @override
  FormModelCustom<T> validate() => _copyWith(status: FormStatus.dirty);

  /// Adds a validator to the form model.
  ///
  /// Returns a new [FormModelCustom] instance with the added validator included in its list
  /// of validators.
  @override
  FormModelCustom<T?> addValidator(BaseFormModelValidator<T?> validator) {
    final updatedValidators = List<BaseFormModelValidator<T?>>.from(validators)..add(validator);
    return _copyWith(validators: updatedValidators);
  }

  /// Removes a validator from the form model.
  ///
  /// Returns a new [FormModelCustom] instance with the specified validator removed from its
  /// list of validators. If the validator is not found, returns the current instance unchanged.
  @override
  FormModelCustom<T?> removeValidator(BaseFormModelValidator<T?> validator) {
    final updatedValidators = List<BaseFormModelValidator<T?>>.from(validators)..remove(validator);
    return _copyWith(validators: updatedValidators);
  }

  /// Retrieves a list of all validation errors affecting the form field.
  ///
  /// If the form field is in a dirty state, it collects and returns all validation
  /// errors from the attached validators. If the form field is not dirty, it returns
  /// an empty list.
  @override
  List<FormError<T?>> get errorsList {
    if (status == FormStatus.dirty) {
      return validators.map((e) => e.validate(value)).nonNulls.toList();
    }
    return [];
  }

  /// Retrieves the list of validators attached to the form field.
  @override
  List<BaseFormModelValidator<T?>> get validators => _validators;

  /// Creates a copy of the current [FormModelCustom] with specified values.
  ///
  /// This method is used internally to create new instances of [FormModelCustom] with updated state.
  /// It ensures immutability by returning new instances instead of modifying existing ones.
  ///
  /// Parameters:
  /// - [value]: The new value to set (optional).
  /// - [status]: The new status to set (optional).
  /// - [validators]: The new list of validators to set (optional).
  ///
  /// Returns:
  /// - A new [FormModelCustom] instance with the specified updates.
  FormModelCustom<T> _copyWith({
    T? value,
    FormStatus? status,
    List<BaseFormModelValidator<T?>>? validators,
  }) {
    return FormModelCustom(
      value: value ?? this.value,
      status: status ?? this.status,
      validators: validators ?? this.validators,
    );
  }

  /// Compares two [FormModelCustom] instances for equality.
  ///
  /// Returns `true` if both instances have the same value and status.
  @override
  bool operator ==(Object other) => other is FormModelCustom && other.value == value && other.status == status;

  /// Generates a hash code for the [FormModelCustom] instance.
  ///
  /// The hash code is based on the value and status.
  @override
  int get hashCode => Object.hash(value, status);
}
