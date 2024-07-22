import 'package:flutter/foundation.dart';
import 'package:form_model/src/model/status/form_model_status.dart';
import 'package:form_model/src/model/contract/i_form_model.dart';
import 'package:form_model/src/model/contract/i_form_model_validator.dart';

abstract base class BaseFormModel<
    T extends Object?,
    TChildModel extends BaseFormModel<T, TChildModel, E>,
    E extends Object> implements IFormModel<T, E> {
  @override
  final T value;

  @override
  final FormModelStatus status;

  final List<IFormModelValidator<T, E>> _validators;

  final Set<Type> _restrictedValidators;

  final E? _manualError;

  const BaseFormModel(
    T initialValue, {
    this.status = const FormModelStatus.pure(),
    List<IFormModelValidator<T, E>> validators = const [],
    Set<Type> restrictedValidators = const {},
    required E? manualError,
  })  : _manualError = manualError,
        value = initialValue,
        _validators = validators,
        _restrictedValidators = restrictedValidators;

  @override
  E? get error {
    if (status.isNotDirty) return null;

    if (_manualError != null) return _manualError;

    return filteredValidators.map((e) => e.validate(value)).firstWhere(
          (e) => e != null,
          orElse: () => null,
        );
  }

  @override
  bool get isValid => error == null;

  @override
  TChildModel reset({
    ValueGetter<T>? value,
    FormModelStatus status = const FormModelStatus.pure(),
  }) =>
      copyWith(status: status, value: value);

  @override
  TChildModel setValue(
    T value, {
    FormModelStatus status = const FormModelStatus.edited(),
  }) =>
      copyWith(
        status: status,
        value: () => value,
      );

  @override
  TChildModel dirty({
    E? error,
    bool force = true,
  }) {
    final toDirty = force || status.isNotPure;
    return copyWith(
      status: toDirty ? const FormModelStatus.dirty() : null,
      manualError: toDirty ? error : null,
    );
  }

  @override
  TChildModel switchValidator(Type type, {required bool active}) {
    final isRestricted = _restrictedValidators.contains(type);

    if (active != isRestricted) {
      return copyWith();
    }

    if (active) {
      return copyWith(
        restrictedValidators: {
          ..._restrictedValidators,
          type,
        },
      );
    } else {
      return copyWith(
        restrictedValidators: Set.from(
          _restrictedValidators.where((e) => e != type),
        ),
      );
    }
  }

  @override
  TChildModel replaceValidator(
    bool Function(IFormModelValidator<T, E> validator) predicate, {
    required IFormModelValidator<T, E> newValidator,
  }) {
    final updatedValidators = _validators.map((validator) {
      return predicate(validator) ? newValidator : validator;
    }).toList();

    return copyWith(validators: updatedValidators);
  }

  @override
  Iterable<E> get errorsList {
    if (status.isNotDirty) return const [];

    if (_manualError != null) return [_manualError];

    return filteredValidators.map((e) => e.validate(value)).nonNulls;
  }

  @override
  Iterable<IFormModelValidator<T, E>> get validators => _validators;

  @protected
  Iterable<IFormModelValidator<T, E>> get filteredValidators => _validators
      .map((e) => restrictedValidators.contains(e.runtimeType) ? null : e)
      .nonNulls;

  @protected
  Set<Type> get restrictedValidators => _restrictedValidators;

  @protected
  TChildModel copyWith({
    ValueGetter<T>? value,
    FormModelStatus? status,
    List<IFormModelValidator<T, E>>? validators,
    Set<Type>? restrictedValidators,
    E? manualError,
  });

  @override
  int get hashCode => Object.hash(
        value,
        status,
        _restrictedValidators,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BaseFormModel<T, TChildModel, E> &&
          runtimeType == other.runtimeType &&
          other.value == value &&
          other.status == status &&
          other._restrictedValidators == _restrictedValidators;
}
