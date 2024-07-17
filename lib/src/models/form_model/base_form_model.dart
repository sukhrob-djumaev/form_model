import 'package:flutter/foundation.dart';
import 'package:form_model/src/models/form_model/form_model_status.dart';
import 'package:form_model/src/models/form_model/i_form_model.dart';
import 'package:form_model/src/models/form_model_validator/i_form_model_validator.dart';

abstract base class BaseFormModel<T extends Object?, E extends Object>
    implements IFormModel<T, E> {
  @override
  final T value;

  @override
  final FormModelStatus status;

  final List<IFormModelValidator<T, E>> _validators;

  final Set<Type> _restrictedValidators;

  final E? _manualError;

  const BaseFormModel(
    T initialValue, {
    this.status = FormModelStatus.pure,
    List<IFormModelValidator<T, E>> validators = const [],
    Set<Type> restrictedValidators = const {},
    required E? manualError,
  })  : _manualError = manualError,
        value = initialValue,
        _validators = validators,
        _restrictedValidators = restrictedValidators;

  @override
  E? get error {
    if (status != FormModelStatus.dirty) return null;

    if (_manualError != null) return _manualError;

    return filteredValidators.map((e) => e.validate(value)).firstWhere(
          (e) => e != null,
          orElse: () => null,
        );
  }

  @override
  bool get isValid => error == null;

  @override
  BaseFormModel<T, E> reset(ValueGetter<T>? value) =>
      copyWith(status: FormModelStatus.pure, value: value);

  @override
  BaseFormModel<T, E> setValue(
    T value, {
    bool reactive = false,
  }) =>
      copyWith(
        status: reactive ? FormModelStatus.pure : FormModelStatus.dirty,
        value: () => value,
      );

  @override
  BaseFormModel<T, E> dirty([E? error]) =>
      copyWith(status: FormModelStatus.dirty, manualError: error);

  @override
  BaseFormModel<T, E> switchValidator(Type type, {required bool active}) {
    final isRestricted = _restrictedValidators.contains(type);

    if (active != isRestricted) {
      return this;
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
  Iterable<E> get errorsList {
    if (status != FormModelStatus.dirty) return const [];

    if (_manualError != null) return [_manualError];

    return filteredValidators.map((e) => e.validate(value)).nonNulls;
  }

  @override
  Iterable<IFormModelValidator<T, E>> get validators => _validators;

  @protected
  Iterable<IFormModelValidator<T, E>> get filteredValidators => _validators
      .map((e) => restrictedValidators.contains(e.runtimeType) ? e : null)
      .nonNulls;

  @protected
  Set<Type> get restrictedValidators => _restrictedValidators;

  @protected
  BaseFormModel<T, E> copyWith({
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
      other is BaseFormModel<T, E> &&
          runtimeType == other.runtimeType &&
          other.value == value &&
          other.status == status &&
          other._restrictedValidators == _restrictedValidators;
}
