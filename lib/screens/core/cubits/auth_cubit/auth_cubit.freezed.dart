// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() dispose,
    required TResult Function() save,
    required TResult Function() loading,
    required TResult Function() updatePassword,
    required TResult Function(NetworkExceptions? networkException) failure,
    required TResult Function(String? data, String? message) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? dispose,
    TResult? Function()? save,
    TResult? Function()? loading,
    TResult? Function()? updatePassword,
    TResult? Function(NetworkExceptions? networkException)? failure,
    TResult? Function(String? data, String? message)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? dispose,
    TResult Function()? save,
    TResult Function()? loading,
    TResult Function()? updatePassword,
    TResult Function(NetworkExceptions? networkException)? failure,
    TResult Function(String? data, String? message)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Dispose value) dispose,
    required TResult Function(_Save value) save,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UpdatePassword value) updatePassword,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Dispose value)? dispose,
    TResult? Function(_Save value)? save,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UpdatePassword value)? updatePassword,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Success value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Dispose value)? dispose,
    TResult Function(_Save value)? save,
    TResult Function(_Loading value)? loading,
    TResult Function(_UpdatePassword value)? updatePassword,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() dispose,
    required TResult Function() save,
    required TResult Function() loading,
    required TResult Function() updatePassword,
    required TResult Function(NetworkExceptions? networkException) failure,
    required TResult Function(String? data, String? message) success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? dispose,
    TResult? Function()? save,
    TResult? Function()? loading,
    TResult? Function()? updatePassword,
    TResult? Function(NetworkExceptions? networkException)? failure,
    TResult? Function(String? data, String? message)? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? dispose,
    TResult Function()? save,
    TResult Function()? loading,
    TResult Function()? updatePassword,
    TResult Function(NetworkExceptions? networkException)? failure,
    TResult Function(String? data, String? message)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Dispose value) dispose,
    required TResult Function(_Save value) save,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UpdatePassword value) updatePassword,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Success value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Dispose value)? dispose,
    TResult? Function(_Save value)? save,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UpdatePassword value)? updatePassword,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Success value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Dispose value)? dispose,
    TResult Function(_Save value)? save,
    TResult Function(_Loading value)? loading,
    TResult Function(_UpdatePassword value)? updatePassword,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$DisposeImplCopyWith<$Res> {
  factory _$$DisposeImplCopyWith(
          _$DisposeImpl value, $Res Function(_$DisposeImpl) then) =
      __$$DisposeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DisposeImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$DisposeImpl>
    implements _$$DisposeImplCopyWith<$Res> {
  __$$DisposeImplCopyWithImpl(
      _$DisposeImpl _value, $Res Function(_$DisposeImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DisposeImpl implements _Dispose {
  const _$DisposeImpl();

  @override
  String toString() {
    return 'AuthState.dispose()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DisposeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() dispose,
    required TResult Function() save,
    required TResult Function() loading,
    required TResult Function() updatePassword,
    required TResult Function(NetworkExceptions? networkException) failure,
    required TResult Function(String? data, String? message) success,
  }) {
    return dispose();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? dispose,
    TResult? Function()? save,
    TResult? Function()? loading,
    TResult? Function()? updatePassword,
    TResult? Function(NetworkExceptions? networkException)? failure,
    TResult? Function(String? data, String? message)? success,
  }) {
    return dispose?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? dispose,
    TResult Function()? save,
    TResult Function()? loading,
    TResult Function()? updatePassword,
    TResult Function(NetworkExceptions? networkException)? failure,
    TResult Function(String? data, String? message)? success,
    required TResult orElse(),
  }) {
    if (dispose != null) {
      return dispose();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Dispose value) dispose,
    required TResult Function(_Save value) save,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UpdatePassword value) updatePassword,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Success value) success,
  }) {
    return dispose(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Dispose value)? dispose,
    TResult? Function(_Save value)? save,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UpdatePassword value)? updatePassword,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Success value)? success,
  }) {
    return dispose?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Dispose value)? dispose,
    TResult Function(_Save value)? save,
    TResult Function(_Loading value)? loading,
    TResult Function(_UpdatePassword value)? updatePassword,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (dispose != null) {
      return dispose(this);
    }
    return orElse();
  }
}

abstract class _Dispose implements AuthState {
  const factory _Dispose() = _$DisposeImpl;
}

/// @nodoc
abstract class _$$SaveImplCopyWith<$Res> {
  factory _$$SaveImplCopyWith(
          _$SaveImpl value, $Res Function(_$SaveImpl) then) =
      __$$SaveImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SaveImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$SaveImpl>
    implements _$$SaveImplCopyWith<$Res> {
  __$$SaveImplCopyWithImpl(_$SaveImpl _value, $Res Function(_$SaveImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SaveImpl implements _Save {
  const _$SaveImpl();

  @override
  String toString() {
    return 'AuthState.save()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SaveImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() dispose,
    required TResult Function() save,
    required TResult Function() loading,
    required TResult Function() updatePassword,
    required TResult Function(NetworkExceptions? networkException) failure,
    required TResult Function(String? data, String? message) success,
  }) {
    return save();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? dispose,
    TResult? Function()? save,
    TResult? Function()? loading,
    TResult? Function()? updatePassword,
    TResult? Function(NetworkExceptions? networkException)? failure,
    TResult? Function(String? data, String? message)? success,
  }) {
    return save?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? dispose,
    TResult Function()? save,
    TResult Function()? loading,
    TResult Function()? updatePassword,
    TResult Function(NetworkExceptions? networkException)? failure,
    TResult Function(String? data, String? message)? success,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Dispose value) dispose,
    required TResult Function(_Save value) save,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UpdatePassword value) updatePassword,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Success value) success,
  }) {
    return save(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Dispose value)? dispose,
    TResult? Function(_Save value)? save,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UpdatePassword value)? updatePassword,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Success value)? success,
  }) {
    return save?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Dispose value)? dispose,
    TResult Function(_Save value)? save,
    TResult Function(_Loading value)? loading,
    TResult Function(_UpdatePassword value)? updatePassword,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save(this);
    }
    return orElse();
  }
}

abstract class _Save implements AuthState {
  const factory _Save() = _$SaveImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() dispose,
    required TResult Function() save,
    required TResult Function() loading,
    required TResult Function() updatePassword,
    required TResult Function(NetworkExceptions? networkException) failure,
    required TResult Function(String? data, String? message) success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? dispose,
    TResult? Function()? save,
    TResult? Function()? loading,
    TResult? Function()? updatePassword,
    TResult? Function(NetworkExceptions? networkException)? failure,
    TResult? Function(String? data, String? message)? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? dispose,
    TResult Function()? save,
    TResult Function()? loading,
    TResult Function()? updatePassword,
    TResult Function(NetworkExceptions? networkException)? failure,
    TResult Function(String? data, String? message)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Dispose value) dispose,
    required TResult Function(_Save value) save,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UpdatePassword value) updatePassword,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Success value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Dispose value)? dispose,
    TResult? Function(_Save value)? save,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UpdatePassword value)? updatePassword,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Success value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Dispose value)? dispose,
    TResult Function(_Save value)? save,
    TResult Function(_Loading value)? loading,
    TResult Function(_UpdatePassword value)? updatePassword,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AuthState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$UpdatePasswordImplCopyWith<$Res> {
  factory _$$UpdatePasswordImplCopyWith(_$UpdatePasswordImpl value,
          $Res Function(_$UpdatePasswordImpl) then) =
      __$$UpdatePasswordImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdatePasswordImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$UpdatePasswordImpl>
    implements _$$UpdatePasswordImplCopyWith<$Res> {
  __$$UpdatePasswordImplCopyWithImpl(
      _$UpdatePasswordImpl _value, $Res Function(_$UpdatePasswordImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UpdatePasswordImpl implements _UpdatePassword {
  const _$UpdatePasswordImpl();

  @override
  String toString() {
    return 'AuthState.updatePassword()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UpdatePasswordImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() dispose,
    required TResult Function() save,
    required TResult Function() loading,
    required TResult Function() updatePassword,
    required TResult Function(NetworkExceptions? networkException) failure,
    required TResult Function(String? data, String? message) success,
  }) {
    return updatePassword();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? dispose,
    TResult? Function()? save,
    TResult? Function()? loading,
    TResult? Function()? updatePassword,
    TResult? Function(NetworkExceptions? networkException)? failure,
    TResult? Function(String? data, String? message)? success,
  }) {
    return updatePassword?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? dispose,
    TResult Function()? save,
    TResult Function()? loading,
    TResult Function()? updatePassword,
    TResult Function(NetworkExceptions? networkException)? failure,
    TResult Function(String? data, String? message)? success,
    required TResult orElse(),
  }) {
    if (updatePassword != null) {
      return updatePassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Dispose value) dispose,
    required TResult Function(_Save value) save,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UpdatePassword value) updatePassword,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Success value) success,
  }) {
    return updatePassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Dispose value)? dispose,
    TResult? Function(_Save value)? save,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UpdatePassword value)? updatePassword,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Success value)? success,
  }) {
    return updatePassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Dispose value)? dispose,
    TResult Function(_Save value)? save,
    TResult Function(_Loading value)? loading,
    TResult Function(_UpdatePassword value)? updatePassword,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (updatePassword != null) {
      return updatePassword(this);
    }
    return orElse();
  }
}

abstract class _UpdatePassword implements AuthState {
  const factory _UpdatePassword() = _$UpdatePasswordImpl;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl value, $Res Function(_$FailureImpl) then) =
      __$$FailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({NetworkExceptions? networkException});

  $NetworkExceptionsCopyWith<$Res>? get networkException;
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? networkException = freezed,
  }) {
    return _then(_$FailureImpl(
      freezed == networkException
          ? _value.networkException
          : networkException // ignore: cast_nullable_to_non_nullable
              as NetworkExceptions?,
    ));
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NetworkExceptionsCopyWith<$Res>? get networkException {
    if (_value.networkException == null) {
      return null;
    }

    return $NetworkExceptionsCopyWith<$Res>(_value.networkException!, (value) {
      return _then(_value.copyWith(networkException: value));
    });
  }
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl(this.networkException);

  @override
  final NetworkExceptions? networkException;

  @override
  String toString() {
    return 'AuthState.failure(networkException: $networkException)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            (identical(other.networkException, networkException) ||
                other.networkException == networkException));
  }

  @override
  int get hashCode => Object.hash(runtimeType, networkException);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() dispose,
    required TResult Function() save,
    required TResult Function() loading,
    required TResult Function() updatePassword,
    required TResult Function(NetworkExceptions? networkException) failure,
    required TResult Function(String? data, String? message) success,
  }) {
    return failure(networkException);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? dispose,
    TResult? Function()? save,
    TResult? Function()? loading,
    TResult? Function()? updatePassword,
    TResult? Function(NetworkExceptions? networkException)? failure,
    TResult? Function(String? data, String? message)? success,
  }) {
    return failure?.call(networkException);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? dispose,
    TResult Function()? save,
    TResult Function()? loading,
    TResult Function()? updatePassword,
    TResult Function(NetworkExceptions? networkException)? failure,
    TResult Function(String? data, String? message)? success,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(networkException);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Dispose value) dispose,
    required TResult Function(_Save value) save,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UpdatePassword value) updatePassword,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Success value) success,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Dispose value)? dispose,
    TResult? Function(_Save value)? save,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UpdatePassword value)? updatePassword,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Success value)? success,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Dispose value)? dispose,
    TResult Function(_Save value)? save,
    TResult Function(_Loading value)? loading,
    TResult Function(_UpdatePassword value)? updatePassword,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements AuthState {
  const factory _Failure(final NetworkExceptions? networkException) =
      _$FailureImpl;

  NetworkExceptions? get networkException;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? data, String? message});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_$SuccessImpl(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.data, this.message);

  @override
  final String? data;
  @override
  final String? message;

  @override
  String toString() {
    return 'AuthState.success(data: $data, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data, message);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() dispose,
    required TResult Function() save,
    required TResult Function() loading,
    required TResult Function() updatePassword,
    required TResult Function(NetworkExceptions? networkException) failure,
    required TResult Function(String? data, String? message) success,
  }) {
    return success(data, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? dispose,
    TResult? Function()? save,
    TResult? Function()? loading,
    TResult? Function()? updatePassword,
    TResult? Function(NetworkExceptions? networkException)? failure,
    TResult? Function(String? data, String? message)? success,
  }) {
    return success?.call(data, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? dispose,
    TResult Function()? save,
    TResult Function()? loading,
    TResult Function()? updatePassword,
    TResult Function(NetworkExceptions? networkException)? failure,
    TResult Function(String? data, String? message)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Dispose value) dispose,
    required TResult Function(_Save value) save,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UpdatePassword value) updatePassword,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Dispose value)? dispose,
    TResult? Function(_Save value)? save,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UpdatePassword value)? updatePassword,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Success value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Dispose value)? dispose,
    TResult Function(_Save value)? save,
    TResult Function(_Loading value)? loading,
    TResult Function(_UpdatePassword value)? updatePassword,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements AuthState {
  const factory _Success(final String? data, final String? message) =
      _$SuccessImpl;

  String? get data;
  String? get message;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
