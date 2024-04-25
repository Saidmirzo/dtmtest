// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  BlocStatus get loginWithGoogleStaus => throw _privateConstructorUsedError;
  BlocStatus get getLocaleUserStatus => throw _privateConstructorUsedError;
  BlocStatus get logOutStatus => throw _privateConstructorUsedError;
  UserModel? get userModel => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call(
      {BlocStatus loginWithGoogleStaus,
      BlocStatus getLocaleUserStatus,
      BlocStatus logOutStatus,
      UserModel? userModel,
      String? message});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginWithGoogleStaus = null,
    Object? getLocaleUserStatus = null,
    Object? logOutStatus = null,
    Object? userModel = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      loginWithGoogleStaus: null == loginWithGoogleStaus
          ? _value.loginWithGoogleStaus
          : loginWithGoogleStaus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      getLocaleUserStatus: null == getLocaleUserStatus
          ? _value.getLocaleUserStatus
          : getLocaleUserStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      logOutStatus: null == logOutStatus
          ? _value.logOutStatus
          : logOutStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      userModel: freezed == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) =
      __$$AuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BlocStatus loginWithGoogleStaus,
      BlocStatus getLocaleUserStatus,
      BlocStatus logOutStatus,
      UserModel? userModel,
      String? message});
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginWithGoogleStaus = null,
    Object? getLocaleUserStatus = null,
    Object? logOutStatus = null,
    Object? userModel = freezed,
    Object? message = freezed,
  }) {
    return _then(_$AuthStateImpl(
      loginWithGoogleStaus: null == loginWithGoogleStaus
          ? _value.loginWithGoogleStaus
          : loginWithGoogleStaus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      getLocaleUserStatus: null == getLocaleUserStatus
          ? _value.getLocaleUserStatus
          : getLocaleUserStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      logOutStatus: null == logOutStatus
          ? _value.logOutStatus
          : logOutStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      userModel: freezed == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AuthStateImpl extends _AuthState {
  const _$AuthStateImpl(
      {this.loginWithGoogleStaus = BlocStatus.notInitialized,
      this.getLocaleUserStatus = BlocStatus.notInitialized,
      this.logOutStatus = BlocStatus.notInitialized,
      this.userModel,
      this.message})
      : super._();

  @override
  @JsonKey()
  final BlocStatus loginWithGoogleStaus;
  @override
  @JsonKey()
  final BlocStatus getLocaleUserStatus;
  @override
  @JsonKey()
  final BlocStatus logOutStatus;
  @override
  final UserModel? userModel;
  @override
  final String? message;

  @override
  String toString() {
    return 'AuthState(loginWithGoogleStaus: $loginWithGoogleStaus, getLocaleUserStatus: $getLocaleUserStatus, logOutStatus: $logOutStatus, userModel: $userModel, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.loginWithGoogleStaus, loginWithGoogleStaus) ||
                other.loginWithGoogleStaus == loginWithGoogleStaus) &&
            (identical(other.getLocaleUserStatus, getLocaleUserStatus) ||
                other.getLocaleUserStatus == getLocaleUserStatus) &&
            (identical(other.logOutStatus, logOutStatus) ||
                other.logOutStatus == logOutStatus) &&
            (identical(other.userModel, userModel) ||
                other.userModel == userModel) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loginWithGoogleStaus,
      getLocaleUserStatus, logOutStatus, userModel, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState extends AuthState {
  const factory _AuthState(
      {final BlocStatus loginWithGoogleStaus,
      final BlocStatus getLocaleUserStatus,
      final BlocStatus logOutStatus,
      final UserModel? userModel,
      final String? message}) = _$AuthStateImpl;
  const _AuthState._() : super._();

  @override
  BlocStatus get loginWithGoogleStaus;
  @override
  BlocStatus get getLocaleUserStatus;
  @override
  BlocStatus get logOutStatus;
  @override
  UserModel? get userModel;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
