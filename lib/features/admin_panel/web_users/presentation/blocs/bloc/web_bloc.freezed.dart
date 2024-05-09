// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'web_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WebState {
  BlocStatus get getAllUsersStatus => throw _privateConstructorUsedError;
  BlocStatus get getAllThemesStatus => throw _privateConstructorUsedError;
  BlocStatus get updateImageStatus => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<UserModel>? get listUsers => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WebStateCopyWith<WebState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebStateCopyWith<$Res> {
  factory $WebStateCopyWith(WebState value, $Res Function(WebState) then) =
      _$WebStateCopyWithImpl<$Res, WebState>;
  @useResult
  $Res call(
      {BlocStatus getAllUsersStatus,
      BlocStatus getAllThemesStatus,
      BlocStatus updateImageStatus,
      String? message,
      List<UserModel>? listUsers});
}

/// @nodoc
class _$WebStateCopyWithImpl<$Res, $Val extends WebState>
    implements $WebStateCopyWith<$Res> {
  _$WebStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getAllUsersStatus = null,
    Object? getAllThemesStatus = null,
    Object? updateImageStatus = null,
    Object? message = freezed,
    Object? listUsers = freezed,
  }) {
    return _then(_value.copyWith(
      getAllUsersStatus: null == getAllUsersStatus
          ? _value.getAllUsersStatus
          : getAllUsersStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      getAllThemesStatus: null == getAllThemesStatus
          ? _value.getAllThemesStatus
          : getAllThemesStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      updateImageStatus: null == updateImageStatus
          ? _value.updateImageStatus
          : updateImageStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      listUsers: freezed == listUsers
          ? _value.listUsers
          : listUsers // ignore: cast_nullable_to_non_nullable
              as List<UserModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WebStateImplCopyWith<$Res>
    implements $WebStateCopyWith<$Res> {
  factory _$$WebStateImplCopyWith(
          _$WebStateImpl value, $Res Function(_$WebStateImpl) then) =
      __$$WebStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BlocStatus getAllUsersStatus,
      BlocStatus getAllThemesStatus,
      BlocStatus updateImageStatus,
      String? message,
      List<UserModel>? listUsers});
}

/// @nodoc
class __$$WebStateImplCopyWithImpl<$Res>
    extends _$WebStateCopyWithImpl<$Res, _$WebStateImpl>
    implements _$$WebStateImplCopyWith<$Res> {
  __$$WebStateImplCopyWithImpl(
      _$WebStateImpl _value, $Res Function(_$WebStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getAllUsersStatus = null,
    Object? getAllThemesStatus = null,
    Object? updateImageStatus = null,
    Object? message = freezed,
    Object? listUsers = freezed,
  }) {
    return _then(_$WebStateImpl(
      getAllUsersStatus: null == getAllUsersStatus
          ? _value.getAllUsersStatus
          : getAllUsersStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      getAllThemesStatus: null == getAllThemesStatus
          ? _value.getAllThemesStatus
          : getAllThemesStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      updateImageStatus: null == updateImageStatus
          ? _value.updateImageStatus
          : updateImageStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      listUsers: freezed == listUsers
          ? _value._listUsers
          : listUsers // ignore: cast_nullable_to_non_nullable
              as List<UserModel>?,
    ));
  }
}

/// @nodoc

class _$WebStateImpl extends _WebState {
  const _$WebStateImpl(
      {this.getAllUsersStatus = BlocStatus.notInitialized,
      this.getAllThemesStatus = BlocStatus.notInitialized,
      this.updateImageStatus = BlocStatus.notInitialized,
      this.message,
      final List<UserModel>? listUsers})
      : _listUsers = listUsers,
        super._();

  @override
  @JsonKey()
  final BlocStatus getAllUsersStatus;
  @override
  @JsonKey()
  final BlocStatus getAllThemesStatus;
  @override
  @JsonKey()
  final BlocStatus updateImageStatus;
  @override
  final String? message;
  final List<UserModel>? _listUsers;
  @override
  List<UserModel>? get listUsers {
    final value = _listUsers;
    if (value == null) return null;
    if (_listUsers is EqualUnmodifiableListView) return _listUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'WebState(getAllUsersStatus: $getAllUsersStatus, getAllThemesStatus: $getAllThemesStatus, updateImageStatus: $updateImageStatus, message: $message, listUsers: $listUsers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WebStateImpl &&
            (identical(other.getAllUsersStatus, getAllUsersStatus) ||
                other.getAllUsersStatus == getAllUsersStatus) &&
            (identical(other.getAllThemesStatus, getAllThemesStatus) ||
                other.getAllThemesStatus == getAllThemesStatus) &&
            (identical(other.updateImageStatus, updateImageStatus) ||
                other.updateImageStatus == updateImageStatus) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._listUsers, _listUsers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      getAllUsersStatus,
      getAllThemesStatus,
      updateImageStatus,
      message,
      const DeepCollectionEquality().hash(_listUsers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WebStateImplCopyWith<_$WebStateImpl> get copyWith =>
      __$$WebStateImplCopyWithImpl<_$WebStateImpl>(this, _$identity);
}

abstract class _WebState extends WebState {
  const factory _WebState(
      {final BlocStatus getAllUsersStatus,
      final BlocStatus getAllThemesStatus,
      final BlocStatus updateImageStatus,
      final String? message,
      final List<UserModel>? listUsers}) = _$WebStateImpl;
  const _WebState._() : super._();

  @override
  BlocStatus get getAllUsersStatus;
  @override
  BlocStatus get getAllThemesStatus;
  @override
  BlocStatus get updateImageStatus;
  @override
  String? get message;
  @override
  List<UserModel>? get listUsers;
  @override
  @JsonKey(ignore: true)
  _$$WebStateImplCopyWith<_$WebStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
