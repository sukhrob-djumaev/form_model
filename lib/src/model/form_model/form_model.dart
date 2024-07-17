import 'package:flutter/foundation.dart';
import 'package:form_model/src/model/form_model/base_form_model.dart';
import 'package:form_model/src/model/form_model/form_model_status.dart';
import 'package:form_model/src/model/form_model_error.dart';
import 'package:form_model/src/model/form_model_validator/i_form_model_validator.dart';

final class FormModel<T extends Object>
    extends BaseFormModel<T, FormModelError<T>> {
  const FormModel(
    super.initialValue, {
    super.status,
    super.validators,
    super.restrictedValidators,
  }) : super(
          manualError: null,
        );

  const FormModel._(
    super.initialValue, {
    required super.status,
    required super.validators,
    required super.restrictedValidators,
    required super.manualError,
  });

  @override
  FormModel<T> copyWith({
    ValueGetter<T>? value,
    FormModelStatus? status,
    List<IFormModelValidator<T, FormModelError<T>>>? validators,
    Set<Type>? restrictedValidators,
    FormModelError<T>? manualError,
  }) {
    return FormModel._(
      value != null ? value() : this.value,
      status: status ?? this.status,
      validators: validators ?? this.validators.toList(),
      restrictedValidators: restrictedValidators ?? this.restrictedValidators,
      manualError: manualError,
    );
  }
}

final class NullableFormModel<T extends Object>
    extends BaseFormModel<T?, FormModelError<T?>> {
  const NullableFormModel({
    T? initialValue,
    super.status,
    super.validators,
    super.restrictedValidators,
  }) : super(
          initialValue,
          manualError: null,
        );

  const NullableFormModel._(
    super.initialValue, {
    required super.status,
    required super.validators,
    required super.restrictedValidators,
    required super.manualError,
  });

  @override
  NullableFormModel<T> copyWith({
    ValueGetter<T?>? value,
    FormModelStatus? status,
    List<IFormModelValidator<T?, FormModelError<T?>>>? validators,
    Set<Type>? restrictedValidators,
    FormModelError<T?>? manualError,
  }) {
    return NullableFormModel._(
      value != null ? value() : this.value,
      status: status ?? this.status,
      validators: validators ?? this.validators.toList(),
      restrictedValidators: restrictedValidators ?? this.restrictedValidators,
      manualError: manualError,
    );
  }
}
