// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'web_home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WebHomeState {
  BlocStatus get getHomeDetailStatus => throw _privateConstructorUsedError;
  HomeDetailModel? get homeDetailModel => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WebHomeStateCopyWith<WebHomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebHomeStateCopyWith<$Res> {
  factory $WebHomeStateCopyWith(
          WebHomeState value, $Res Function(WebHomeState) then) =
      _$WebHomeStateCopyWithImpl<$Res, WebHomeState>;
  @useResult
  $Res call(
      {BlocStatus getHomeDetailStatus,
      HomeDetailModel? homeDetailModel,
      String? message});
}

/// @nodoc
class _$WebHomeStateCopyWithImpl<$Res, $Val extends WebHomeState>
    implements $WebHomeStateCopyWith<$Res> {
  _$WebHomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getHomeDetailStatus = null,
    Object? homeDetailModel = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      getHomeDetailStatus: null == getHomeDetailStatus
          ? _value.getHomeDetailStatus
          : getHomeDetailStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      homeDetailModel: freezed == homeDetailModel
          ? _value.homeDetailModel
          : homeDetailModel // ignore: cast_nullable_to_non_nullable
              as HomeDetailModel?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WebHomeStateImplCopyWith<$Res>
    implements $WebHomeStateCopyWith<$Res> {
  factory _$$WebHomeStateImplCopyWith(
          _$WebHomeStateImpl value, $Res Function(_$WebHomeStateImpl) then) =
      __$$WebHomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BlocStatus getHomeDetailStatus,
      HomeDetailModel? homeDetailModel,
      String? message});
}

/// @nodoc
class __$$WebHomeStateImplCopyWithImpl<$Res>
    extends _$WebHomeStateCopyWithImpl<$Res, _$WebHomeStateImpl>
    implements _$$WebHomeStateImplCopyWith<$Res> {
  __$$WebHomeStateImplCopyWithImpl(
      _$WebHomeStateImpl _value, $Res Function(_$WebHomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getHomeDetailStatus = null,
    Object? homeDetailModel = freezed,
    Object? message = freezed,
  }) {
    return _then(_$WebHomeStateImpl(
      getHomeDetailStatus: null == getHomeDetailStatus
          ? _value.getHomeDetailStatus
          : getHomeDetailStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      homeDetailModel: freezed == homeDetailModel
          ? _value.homeDetailModel
          : homeDetailModel // ignore: cast_nullable_to_non_nullable
              as HomeDetailModel?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$WebHomeStateImpl extends _WebHomeState {
  const _$WebHomeStateImpl(
      {this.getHomeDetailStatus = BlocStatus.notInitialized,
      this.homeDetailModel,
      this.message})
      : super._();

  @override
  @JsonKey()
  final BlocStatus getHomeDetailStatus;
  @override
  final HomeDetailModel? homeDetailModel;
  @override
  final String? message;

  @override
  String toString() {
    return 'WebHomeState(getHomeDetailStatus: $getHomeDetailStatus, homeDetailModel: $homeDetailModel, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WebHomeStateImpl &&
            (identical(other.getHomeDetailStatus, getHomeDetailStatus) ||
                other.getHomeDetailStatus == getHomeDetailStatus) &&
            (identical(other.homeDetailModel, homeDetailModel) ||
                other.homeDetailModel == homeDetailModel) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, getHomeDetailStatus, homeDetailModel, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WebHomeStateImplCopyWith<_$WebHomeStateImpl> get copyWith =>
      __$$WebHomeStateImplCopyWithImpl<_$WebHomeStateImpl>(this, _$identity);
}

abstract class _WebHomeState extends WebHomeState {
  const factory _WebHomeState(
      {final BlocStatus getHomeDetailStatus,
      final HomeDetailModel? homeDetailModel,
      final String? message}) = _$WebHomeStateImpl;
  const _WebHomeState._() : super._();

  @override
  BlocStatus get getHomeDetailStatus;
  @override
  HomeDetailModel? get homeDetailModel;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$WebHomeStateImplCopyWith<_$WebHomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
