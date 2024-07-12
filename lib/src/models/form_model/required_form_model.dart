import 'package:flutter/foundation.dart';
import 'package:form_model/src/enums/form_model_status.dart';
import 'package:form_model/src/models/form_model/base_form_model.dart';
import 'package:form_model/src/models/form_model_error.dart';
import 'package:form_model/src/models/form_model_validator/i_form_model_validator.dart';

final class RequiredFormModel<T extends Object>
    extends BaseFormModel<T, FormModelError<T>> {
  const RequiredFormModel(
    super.initialValue, {
    super.status = FormModelStatus.pure,
    super.validators,
    super.restrictedValidators,
  });

  @override
  RequiredFormModel<T> copyWith({
    ValueGetter<T>? value,
    FormModelStatus? status,
    List<IFormModelValidator<T, FormModelError<T>>>? validators,
    Set<Type>? restrictedValidators,
  }) {
    return RequiredFormModel<T>(
      value != null ? value() : this.value,
      status: status ?? this.status,
      validators: validators ?? this.validators,
      restrictedValidators: restrictedValidators ?? this.restrictedValidators,
    );
  }
}
