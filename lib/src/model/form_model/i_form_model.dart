import 'package:flutter/foundation.dart';
import 'package:form_model/src/model/form_model/form_model_status.dart';
import 'package:form_model/src/model/form_model_validator/i_form_model_validator.dart';

abstract interface class IFormModel<T extends Object?, E extends Object> {
  T get value;

  bool get isValid;

  FormModelStatus get status;

  E? get error;

  Iterable<E> get errorsList;

  Iterable<IFormModelValidator<T, E>> get validators;

  IFormModel<T, E> setValue(
    T value, {
    bool reactive = false,
  });

  IFormModel<T, E> dirty([E? error]);

  IFormModel<T, E> reset(ValueGetter<T>? value);

  IFormModel<T, E> switchValidator(Type type, {required bool active});
}
