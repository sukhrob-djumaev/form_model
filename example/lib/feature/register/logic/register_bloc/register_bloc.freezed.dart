// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegisterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String value) setPassword,
    required TResult Function(String value) setConfirmPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String value)? setPassword,
    TResult? Function(String value)? setConfirmPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String value)? setPassword,
    TResult Function(String value)? setConfirmPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitRegisterEvent value) init,
    required TResult Function(_SetPasswordRegisterEvent value) setPassword,
    required TResult Function(_SetConfirmPasswordRegisterEvent value)
        setConfirmPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitRegisterEvent value)? init,
    TResult? Function(_SetPasswordRegisterEvent value)? setPassword,
    TResult? Function(_SetConfirmPasswordRegisterEvent value)?
        setConfirmPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitRegisterEvent value)? init,
    TResult Function(_SetPasswordRegisterEvent value)? setPassword,
    TResult Function(_SetConfirmPasswordRegisterEvent value)?
        setConfirmPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterEventCopyWith<$Res> {
  factory $RegisterEventCopyWith(
          RegisterEvent value, $Res Function(RegisterEvent) then) =
      _$RegisterEventCopyWithImpl<$Res, RegisterEvent>;
}

/// @nodoc
class _$RegisterEventCopyWithImpl<$Res, $Val extends RegisterEvent>
    implements $RegisterEventCopyWith<$Res> {
  _$RegisterEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitRegisterEventImplCopyWith<$Res> {
  factory _$$InitRegisterEventImplCopyWith(_$InitRegisterEventImpl value,
          $Res Function(_$InitRegisterEventImpl) then) =
      __$$InitRegisterEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitRegisterEventImplCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$InitRegisterEventImpl>
    implements _$$InitRegisterEventImplCopyWith<$Res> {
  __$$InitRegisterEventImplCopyWithImpl(_$InitRegisterEventImpl _value,
      $Res Function(_$InitRegisterEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitRegisterEventImpl implements _InitRegisterEvent {
  const _$InitRegisterEventImpl();

  @override
  String toString() {
    return 'RegisterEvent.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitRegisterEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String value) setPassword,
    required TResult Function(String value) setConfirmPassword,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String value)? setPassword,
    TResult? Function(String value)? setConfirmPassword,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String value)? setPassword,
    TResult Function(String value)? setConfirmPassword,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitRegisterEvent value) init,
    required TResult Function(_SetPasswordRegisterEvent value) setPassword,
    required TResult Function(_SetConfirmPasswordRegisterEvent value)
        setConfirmPassword,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitRegisterEvent value)? init,
    TResult? Function(_SetPasswordRegisterEvent value)? setPassword,
    TResult? Function(_SetConfirmPasswordRegisterEvent value)?
        setConfirmPassword,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitRegisterEvent value)? init,
    TResult Function(_SetPasswordRegisterEvent value)? setPassword,
    TResult Function(_SetConfirmPasswordRegisterEvent value)?
        setConfirmPassword,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _InitRegisterEvent implements RegisterEvent {
  const factory _InitRegisterEvent() = _$InitRegisterEventImpl;
}

/// @nodoc
abstract class _$$SetPasswordRegisterEventImplCopyWith<$Res> {
  factory _$$SetPasswordRegisterEventImplCopyWith(
          _$SetPasswordRegisterEventImpl value,
          $Res Function(_$SetPasswordRegisterEventImpl) then) =
      __$$SetPasswordRegisterEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$SetPasswordRegisterEventImplCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$SetPasswordRegisterEventImpl>
    implements _$$SetPasswordRegisterEventImplCopyWith<$Res> {
  __$$SetPasswordRegisterEventImplCopyWithImpl(
      _$SetPasswordRegisterEventImpl _value,
      $Res Function(_$SetPasswordRegisterEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$SetPasswordRegisterEventImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SetPasswordRegisterEventImpl implements _SetPasswordRegisterEvent {
  const _$SetPasswordRegisterEventImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'RegisterEvent.setPassword(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetPasswordRegisterEventImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetPasswordRegisterEventImplCopyWith<_$SetPasswordRegisterEventImpl>
      get copyWith => __$$SetPasswordRegisterEventImplCopyWithImpl<
          _$SetPasswordRegisterEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String value) setPassword,
    required TResult Function(String value) setConfirmPassword,
  }) {
    return setPassword(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String value)? setPassword,
    TResult? Function(String value)? setConfirmPassword,
  }) {
    return setPassword?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String value)? setPassword,
    TResult Function(String value)? setConfirmPassword,
    required TResult orElse(),
  }) {
    if (setPassword != null) {
      return setPassword(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitRegisterEvent value) init,
    required TResult Function(_SetPasswordRegisterEvent value) setPassword,
    required TResult Function(_SetConfirmPasswordRegisterEvent value)
        setConfirmPassword,
  }) {
    return setPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitRegisterEvent value)? init,
    TResult? Function(_SetPasswordRegisterEvent value)? setPassword,
    TResult? Function(_SetConfirmPasswordRegisterEvent value)?
        setConfirmPassword,
  }) {
    return setPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitRegisterEvent value)? init,
    TResult Function(_SetPasswordRegisterEvent value)? setPassword,
    TResult Function(_SetConfirmPasswordRegisterEvent value)?
        setConfirmPassword,
    required TResult orElse(),
  }) {
    if (setPassword != null) {
      return setPassword(this);
    }
    return orElse();
  }
}

abstract class _SetPasswordRegisterEvent implements RegisterEvent {
  const factory _SetPasswordRegisterEvent(final String value) =
      _$SetPasswordRegisterEventImpl;

  String get value;
  @JsonKey(ignore: true)
  _$$SetPasswordRegisterEventImplCopyWith<_$SetPasswordRegisterEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetConfirmPasswordRegisterEventImplCopyWith<$Res> {
  factory _$$SetConfirmPasswordRegisterEventImplCopyWith(
          _$SetConfirmPasswordRegisterEventImpl value,
          $Res Function(_$SetConfirmPasswordRegisterEventImpl) then) =
      __$$SetConfirmPasswordRegisterEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$SetConfirmPasswordRegisterEventImplCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res,
        _$SetConfirmPasswordRegisterEventImpl>
    implements _$$SetConfirmPasswordRegisterEventImplCopyWith<$Res> {
  __$$SetConfirmPasswordRegisterEventImplCopyWithImpl(
      _$SetConfirmPasswordRegisterEventImpl _value,
      $Res Function(_$SetConfirmPasswordRegisterEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$SetConfirmPasswordRegisterEventImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SetConfirmPasswordRegisterEventImpl
    implements _SetConfirmPasswordRegisterEvent {
  const _$SetConfirmPasswordRegisterEventImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'RegisterEvent.setConfirmPassword(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetConfirmPasswordRegisterEventImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetConfirmPasswordRegisterEventImplCopyWith<
          _$SetConfirmPasswordRegisterEventImpl>
      get copyWith => __$$SetConfirmPasswordRegisterEventImplCopyWithImpl<
          _$SetConfirmPasswordRegisterEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String value) setPassword,
    required TResult Function(String value) setConfirmPassword,
  }) {
    return setConfirmPassword(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String value)? setPassword,
    TResult? Function(String value)? setConfirmPassword,
  }) {
    return setConfirmPassword?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String value)? setPassword,
    TResult Function(String value)? setConfirmPassword,
    required TResult orElse(),
  }) {
    if (setConfirmPassword != null) {
      return setConfirmPassword(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitRegisterEvent value) init,
    required TResult Function(_SetPasswordRegisterEvent value) setPassword,
    required TResult Function(_SetConfirmPasswordRegisterEvent value)
        setConfirmPassword,
  }) {
    return setConfirmPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitRegisterEvent value)? init,
    TResult? Function(_SetPasswordRegisterEvent value)? setPassword,
    TResult? Function(_SetConfirmPasswordRegisterEvent value)?
        setConfirmPassword,
  }) {
    return setConfirmPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitRegisterEvent value)? init,
    TResult Function(_SetPasswordRegisterEvent value)? setPassword,
    TResult Function(_SetConfirmPasswordRegisterEvent value)?
        setConfirmPassword,
    required TResult orElse(),
  }) {
    if (setConfirmPassword != null) {
      return setConfirmPassword(this);
    }
    return orElse();
  }
}

abstract class _SetConfirmPasswordRegisterEvent implements RegisterEvent {
  const factory _SetConfirmPasswordRegisterEvent(final String value) =
      _$SetConfirmPasswordRegisterEventImpl;

  String get value;
  @JsonKey(ignore: true)
  _$$SetConfirmPasswordRegisterEventImplCopyWith<
          _$SetConfirmPasswordRegisterEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RegisterState {
// @Default(SubmissionStatus<void>.idle())
// SubmissionStatus<void> submissionStatus,
// @Default(EmailInput.pure()) EmailInput email,
  FormModel<String> get password => throw _privateConstructorUsedError;
  FormModel<String> get confirmPassword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterStateCopyWith<RegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterStateCopyWith<$Res> {
  factory $RegisterStateCopyWith(
          RegisterState value, $Res Function(RegisterState) then) =
      _$RegisterStateCopyWithImpl<$Res, RegisterState>;
  @useResult
  $Res call({FormModel<String> password, FormModel<String> confirmPassword});
}

/// @nodoc
class _$RegisterStateCopyWithImpl<$Res, $Val extends RegisterState>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
    Object? confirmPassword = null,
  }) {
    return _then(_value.copyWith(
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as FormModel<String>,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as FormModel<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterStateImplCopyWith<$Res>
    implements $RegisterStateCopyWith<$Res> {
  factory _$$RegisterStateImplCopyWith(
          _$RegisterStateImpl value, $Res Function(_$RegisterStateImpl) then) =
      __$$RegisterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FormModel<String> password, FormModel<String> confirmPassword});
}

/// @nodoc
class __$$RegisterStateImplCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$RegisterStateImpl>
    implements _$$RegisterStateImplCopyWith<$Res> {
  __$$RegisterStateImplCopyWithImpl(
      _$RegisterStateImpl _value, $Res Function(_$RegisterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
    Object? confirmPassword = null,
  }) {
    return _then(_$RegisterStateImpl(
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as FormModel<String>,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as FormModel<String>,
    ));
  }
}

/// @nodoc

class _$RegisterStateImpl extends _RegisterState {
  const _$RegisterStateImpl(
      {required this.password, required this.confirmPassword})
      : super._();

// @Default(SubmissionStatus<void>.idle())
// SubmissionStatus<void> submissionStatus,
// @Default(EmailInput.pure()) EmailInput email,
  @override
  final FormModel<String> password;
  @override
  final FormModel<String> confirmPassword;

  @override
  String toString() {
    return 'RegisterState(password: $password, confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterStateImpl &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password, confirmPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterStateImplCopyWith<_$RegisterStateImpl> get copyWith =>
      __$$RegisterStateImplCopyWithImpl<_$RegisterStateImpl>(this, _$identity);
}

abstract class _RegisterState extends RegisterState {
  const factory _RegisterState(
      {required final FormModel<String> password,
      required final FormModel<String> confirmPassword}) = _$RegisterStateImpl;
  const _RegisterState._() : super._();

  @override // @Default(SubmissionStatus<void>.idle())
// SubmissionStatus<void> submissionStatus,
// @Default(EmailInput.pure()) EmailInput email,
  FormModel<String> get password;
  @override
  FormModel<String> get confirmPassword;
  @override
  @JsonKey(ignore: true)
  _$$RegisterStateImplCopyWith<_$RegisterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
