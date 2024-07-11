import 'package:flutter/foundation.dart';
import 'package:form_model/src/enums/form_model_status.dart';
import 'package:form_model/src/models/form_model/base_form_model.dart';
import 'package:form_model/src/models/form_model_validator/form_model_validator.dart';

final class FormModel<T extends Object> extends BaseFormModel<T?> {
  const FormModel({
    T? initialValue,
    super.status = FormModelStatus.pure,
    super.validators,
    super.restrictedValidators,
  }) : super(initialValue);

  @override
  FormModel<T> copyWith({
    ValueGetter<T?>? value,
    FormModelStatus? status,
    List<FormModelValidator<T?>>? validators,
    Set<Type>? restrictedValidators,
  }) {
    return FormModel<T>(
      initialValue: value != null ? value() : this.value,
      status: status ?? this.status,
      validators: validators ?? this.validators,
      restrictedValidators: restrictedValidators ?? this.restrictedValidators,
    );
  }
}
