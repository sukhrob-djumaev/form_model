import 'package:flutter/foundation.dart';
import 'package:form_model/src/model/status/form_model_status.dart';
import 'package:form_model/src/model/contract/i_form_model_validator.dart';

abstract interface class IFormModel<T extends Object?, E extends Object> {
  T get value;

  bool get isValid;

  FormModelStatus get status;

  E? get error;

  Iterable<E> get errorsList;

  Iterable<IFormModelValidator<T, E>> get validators;

  IFormModel<T, E> setValue(
    T value, {
    FormModelStatus status = const FormModelStatus.edited(),
  });

  IFormModel<T, E> dirty({
    E? error,
    bool force = true,
  });

  IFormModel<T, E> reset({
    ValueGetter<T>? value,
    FormModelStatus status = const FormModelStatus.pure(),
  });

  IFormModel<T, E> switchValidator(
    Type type, {
    required bool active,
  });

  IFormModel<T, E> replaceValidator(
    bool Function(IFormModelValidator<T, E> validator) predicate, {
    required IFormModelValidator<T, E> newValidator,
  });
}