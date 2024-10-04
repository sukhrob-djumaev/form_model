import 'package:flutter/foundation.dart';
import 'package:form_model/src/model/contract/i_form_model_validator.dart';

abstract base class BaseMatchValidator<E extends Object>
    implements IFormModelValidator<String, E> {
  const BaseMatchValidator({
    this.valueGetter,
  });

  final ValueGetter<String>? valueGetter;

  @override
  E? validate(String value) {
    if (valueGetter == null) return null;

    final srcValue = valueGetter?.call();

    if (srcValue == value) return null;

    return error;
  }

  E get error;
}
