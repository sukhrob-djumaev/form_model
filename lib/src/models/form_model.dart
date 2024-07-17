import 'package:flutter/foundation.dart';
import 'package:form_model/src/models/form_model_status.dart';
import 'package:form_model/src/models/i_form_model.dart';
import 'package:form_model/src/errors/form_error_key.dart';
import 'package:form_model/src/validators/validators.dart';

final class FormModel<T extends Object> implements IFormModel<T> {
  final T? _value;

  final FormModelStatus _status;

  final List<IFormModelValidator<T>> _validators;

  const FormModel({
    T? value,
    List<IFormModelValidator<T>>? validators,
    FormModelStatus status = FormModelStatus.pure,
  })  : _value = value,
        _status = status,
        _validators = validators ?? const [];

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

  @override
  List<FormErrorKey> get errorsList {
    if (_status == FormModelStatus.dirty) {
      return _validators.map((validator) => validator.validate(value)).nonNulls.toList();
    }
    return [];
  }

  @override
  T? get value => _value;

  @override
  bool get isValid => error == null;

  @override
  bool get isDirty => _status == FormModelStatus.dirty;

  @override
  List<IFormModelValidator<T>> get validators => _validators;

  @override
  FormModel<T> addValidator(IFormModelValidator<T> validator) {
    final updatedValidators = List<IFormModelValidator<T>>.from(_validators)..add(validator);
    return _copyWith(validators: updatedValidators);
  }

  @override
  FormModel removeValidator(IFormModelValidator<T> validator) {
    final updatedValidators = List<IFormModelValidator<T>>.from(_validators)..remove(validator);
    return _copyWith(validators: updatedValidators);
  }

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

  @override
  FormModel<T> reset() => _copyWith(status: FormModelStatus.pure);

  @override
  FormModel<T> setValue(T? value) => _copyWith(value: value);

  @override
  FormModel<T> validate() => _copyWith(status: FormModelStatus.dirty);

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

  @override
  int get hashCode => Object.hash(_value, _status, Object.hashAll(_validators));
}

// typedef StringFormModel = FormModel<String>;
