import 'package:flutter/foundation.dart';
import 'package:form_model/src/model/contract/i_form_model_validator.dart';

abstract base class BaseConfirmPasswordValidator<E extends Object>
    implements IFormModelValidator<String, E> {
  const BaseConfirmPasswordValidator({
    this.passwordGetter,
  });

  final ValueGetter<String>? passwordGetter;

  @override
  E? validate(String value) {
    if (passwordGetter == null) return null;

    final password = passwordGetter?.call();

    if (password == value) return null;

    return error;
  }

  E get error;
}
