// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileState {
  BlocStatus get getProfileDataStatus => throw _privateConstructorUsedError;
  BlocStatus get updateProfileDataStatus => throw _privateConstructorUsedError;
  BlocStatus get uploadImageStatus => throw _privateConstructorUsedError;
  UserModel? get profileData => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  BlocStatus get updateImageStatus => throw _privateConstructorUsedError;
  String? get imageLink => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileStateCopyWith<ProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res, ProfileState>;
  @useResult
  $Res call(
      {BlocStatus getProfileDataStatus,
      BlocStatus updateProfileDataStatus,
      BlocStatus uploadImageStatus,
      UserModel? profileData,
      String? message,
      BlocStatus updateImageStatus,
      String? imageLink});
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res, $Val extends ProfileState>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getProfileDataStatus = null,
    Object? updateProfileDataStatus = null,
    Object? uploadImageStatus = null,
    Object? profileData = freezed,
    Object? message = freezed,
    Object? updateImageStatus = null,
    Object? imageLink = freezed,
  }) {
    return _then(_value.copyWith(
      getProfileDataStatus: null == getProfileDataStatus
          ? _value.getProfileDataStatus
          : getProfileDataStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      updateProfileDataStatus: null == updateProfileDataStatus
          ? _value.updateProfileDataStatus
          : updateProfileDataStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      uploadImageStatus: null == uploadImageStatus
          ? _value.uploadImageStatus
          : uploadImageStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      profileData: freezed == profileData
          ? _value.profileData
          : profileData // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      updateImageStatus: null == updateImageStatus
          ? _value.updateImageStatus
          : updateImageStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      imageLink: freezed == imageLink
          ? _value.imageLink
          : imageLink // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileStateImplCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory _$$ProfileStateImplCopyWith(
          _$ProfileStateImpl value, $Res Function(_$ProfileStateImpl) then) =
      __$$ProfileStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BlocStatus getProfileDataStatus,
      BlocStatus updateProfileDataStatus,
      BlocStatus uploadImageStatus,
      UserModel? profileData,
      String? message,
      BlocStatus updateImageStatus,
      String? imageLink});
}

/// @nodoc
class __$$ProfileStateImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileStateImpl>
    implements _$$ProfileStateImplCopyWith<$Res> {
  __$$ProfileStateImplCopyWithImpl(
      _$ProfileStateImpl _value, $Res Function(_$ProfileStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getProfileDataStatus = null,
    Object? updateProfileDataStatus = null,
    Object? uploadImageStatus = null,
    Object? profileData = freezed,
    Object? message = freezed,
    Object? updateImageStatus = null,
    Object? imageLink = freezed,
  }) {
    return _then(_$ProfileStateImpl(
      getProfileDataStatus: null == getProfileDataStatus
          ? _value.getProfileDataStatus
          : getProfileDataStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      updateProfileDataStatus: null == updateProfileDataStatus
          ? _value.updateProfileDataStatus
          : updateProfileDataStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      uploadImageStatus: null == uploadImageStatus
          ? _value.uploadImageStatus
          : uploadImageStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      profileData: freezed == profileData
          ? _value.profileData
          : profileData // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      updateImageStatus: null == updateImageStatus
          ? _value.updateImageStatus
          : updateImageStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      imageLink: freezed == imageLink
          ? _value.imageLink
          : imageLink // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ProfileStateImpl extends _ProfileState {
  const _$ProfileStateImpl(
      {this.getProfileDataStatus = BlocStatus.notInitialized,
      this.updateProfileDataStatus = BlocStatus.notInitialized,
      this.uploadImageStatus = BlocStatus.notInitialized,
      this.profileData,
      this.message,
      this.updateImageStatus = BlocStatus.notInitialized,
      this.imageLink})
      : super._();

  @override
  @JsonKey()
  final BlocStatus getProfileDataStatus;
  @override
  @JsonKey()
  final BlocStatus updateProfileDataStatus;
  @override
  @JsonKey()
  final BlocStatus uploadImageStatus;
  @override
  final UserModel? profileData;
  @override
  final String? message;
  @override
  @JsonKey()
  final BlocStatus updateImageStatus;
  @override
  final String? imageLink;

  @override
  String toString() {
    return 'ProfileState(getProfileDataStatus: $getProfileDataStatus, updateProfileDataStatus: $updateProfileDataStatus, uploadImageStatus: $uploadImageStatus, profileData: $profileData, message: $message, updateImageStatus: $updateImageStatus, imageLink: $imageLink)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileStateImpl &&
            (identical(other.getProfileDataStatus, getProfileDataStatus) ||
                other.getProfileDataStatus == getProfileDataStatus) &&
            (identical(
                    other.updateProfileDataStatus, updateProfileDataStatus) ||
                other.updateProfileDataStatus == updateProfileDataStatus) &&
            (identical(other.uploadImageStatus, uploadImageStatus) ||
                other.uploadImageStatus == uploadImageStatus) &&
            (identical(other.profileData, profileData) ||
                other.profileData == profileData) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.updateImageStatus, updateImageStatus) ||
                other.updateImageStatus == updateImageStatus) &&
            (identical(other.imageLink, imageLink) ||
                other.imageLink == imageLink));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      getProfileDataStatus,
      updateProfileDataStatus,
      uploadImageStatus,
      profileData,
      message,
      updateImageStatus,
      imageLink);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileStateImplCopyWith<_$ProfileStateImpl> get copyWith =>
      __$$ProfileStateImplCopyWithImpl<_$ProfileStateImpl>(this, _$identity);
}

abstract class _ProfileState extends ProfileState {
  const factory _ProfileState(
      {final BlocStatus getProfileDataStatus,
      final BlocStatus updateProfileDataStatus,
      final BlocStatus uploadImageStatus,
      final UserModel? profileData,
      final String? message,
      final BlocStatus updateImageStatus,
      final String? imageLink}) = _$ProfileStateImpl;
  const _ProfileState._() : super._();

  @override
  BlocStatus get getProfileDataStatus;
  @override
  BlocStatus get updateProfileDataStatus;
  @override
  BlocStatus get uploadImageStatus;
  @override
  UserModel? get profileData;
  @override
  String? get message;
  @override
  BlocStatus get updateImageStatus;
  @override
  String? get imageLink;
  @override
  @JsonKey(ignore: true)
  _$$ProfileStateImplCopyWith<_$ProfileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
