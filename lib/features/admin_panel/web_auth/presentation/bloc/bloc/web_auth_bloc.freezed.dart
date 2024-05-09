// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'web_auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WebAuthState {
  BlocStatus get loginStatus => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WebAuthStateCopyWith<WebAuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebAuthStateCopyWith<$Res> {
  factory $WebAuthStateCopyWith(
          WebAuthState value, $Res Function(WebAuthState) then) =
      _$WebAuthStateCopyWithImpl<$Res, WebAuthState>;
  @useResult
  $Res call({BlocStatus loginStatus, String? message});
}

/// @nodoc
class _$WebAuthStateCopyWithImpl<$Res, $Val extends WebAuthState>
    implements $WebAuthStateCopyWith<$Res> {
  _$WebAuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginStatus = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      loginStatus: null == loginStatus
          ? _value.loginStatus
          : loginStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WebAuthStateImplCopyWith<$Res>
    implements $WebAuthStateCopyWith<$Res> {
  factory _$$WebAuthStateImplCopyWith(
          _$WebAuthStateImpl value, $Res Function(_$WebAuthStateImpl) then) =
      __$$WebAuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BlocStatus loginStatus, String? message});
}

/// @nodoc
class __$$WebAuthStateImplCopyWithImpl<$Res>
    extends _$WebAuthStateCopyWithImpl<$Res, _$WebAuthStateImpl>
    implements _$$WebAuthStateImplCopyWith<$Res> {
  __$$WebAuthStateImplCopyWithImpl(
      _$WebAuthStateImpl _value, $Res Function(_$WebAuthStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginStatus = null,
    Object? message = freezed,
  }) {
    return _then(_$WebAuthStateImpl(
      loginStatus: null == loginStatus
          ? _value.loginStatus
          : loginStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$WebAuthStateImpl extends _WebAuthState {
  const _$WebAuthStateImpl(
      {this.loginStatus = BlocStatus.notInitialized, this.message})
      : super._();

  @override
  @JsonKey()
  final BlocStatus loginStatus;
  @override
  final String? message;

  @override
  String toString() {
    return 'WebAuthState(loginStatus: $loginStatus, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WebAuthStateImpl &&
            (identical(other.loginStatus, loginStatus) ||
                other.loginStatus == loginStatus) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loginStatus, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WebAuthStateImplCopyWith<_$WebAuthStateImpl> get copyWith =>
      __$$WebAuthStateImplCopyWithImpl<_$WebAuthStateImpl>(this, _$identity);
}

abstract class _WebAuthState extends WebAuthState {
  const factory _WebAuthState(
      {final BlocStatus loginStatus,
      final String? message}) = _$WebAuthStateImpl;
  const _WebAuthState._() : super._();

  @override
  BlocStatus get loginStatus;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$WebAuthStateImplCopyWith<_$WebAuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
