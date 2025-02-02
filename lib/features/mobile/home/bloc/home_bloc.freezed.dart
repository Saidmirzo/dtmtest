// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  BlocStatus get getAllStatisticsStatus => throw _privateConstructorUsedError;
  BlocStatus get getAllCarouselImageStatus =>
      throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<UserModel>? get listStatistics => throw _privateConstructorUsedError;
  List<UserModel>? get listSortUsers => throw _privateConstructorUsedError;
  List<AdvertisingModel>? get listAdvertisiong =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {BlocStatus getAllStatisticsStatus,
      BlocStatus getAllCarouselImageStatus,
      String? message,
      List<UserModel>? listStatistics,
      List<UserModel>? listSortUsers,
      List<AdvertisingModel>? listAdvertisiong});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getAllStatisticsStatus = null,
    Object? getAllCarouselImageStatus = null,
    Object? message = freezed,
    Object? listStatistics = freezed,
    Object? listSortUsers = freezed,
    Object? listAdvertisiong = freezed,
  }) {
    return _then(_value.copyWith(
      getAllStatisticsStatus: null == getAllStatisticsStatus
          ? _value.getAllStatisticsStatus
          : getAllStatisticsStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      getAllCarouselImageStatus: null == getAllCarouselImageStatus
          ? _value.getAllCarouselImageStatus
          : getAllCarouselImageStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      listStatistics: freezed == listStatistics
          ? _value.listStatistics
          : listStatistics // ignore: cast_nullable_to_non_nullable
              as List<UserModel>?,
      listSortUsers: freezed == listSortUsers
          ? _value.listSortUsers
          : listSortUsers // ignore: cast_nullable_to_non_nullable
              as List<UserModel>?,
      listAdvertisiong: freezed == listAdvertisiong
          ? _value.listAdvertisiong
          : listAdvertisiong // ignore: cast_nullable_to_non_nullable
              as List<AdvertisingModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BlocStatus getAllStatisticsStatus,
      BlocStatus getAllCarouselImageStatus,
      String? message,
      List<UserModel>? listStatistics,
      List<UserModel>? listSortUsers,
      List<AdvertisingModel>? listAdvertisiong});
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getAllStatisticsStatus = null,
    Object? getAllCarouselImageStatus = null,
    Object? message = freezed,
    Object? listStatistics = freezed,
    Object? listSortUsers = freezed,
    Object? listAdvertisiong = freezed,
  }) {
    return _then(_$HomeStateImpl(
      getAllStatisticsStatus: null == getAllStatisticsStatus
          ? _value.getAllStatisticsStatus
          : getAllStatisticsStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      getAllCarouselImageStatus: null == getAllCarouselImageStatus
          ? _value.getAllCarouselImageStatus
          : getAllCarouselImageStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      listStatistics: freezed == listStatistics
          ? _value._listStatistics
          : listStatistics // ignore: cast_nullable_to_non_nullable
              as List<UserModel>?,
      listSortUsers: freezed == listSortUsers
          ? _value._listSortUsers
          : listSortUsers // ignore: cast_nullable_to_non_nullable
              as List<UserModel>?,
      listAdvertisiong: freezed == listAdvertisiong
          ? _value._listAdvertisiong
          : listAdvertisiong // ignore: cast_nullable_to_non_nullable
              as List<AdvertisingModel>?,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl extends _HomeState {
  const _$HomeStateImpl(
      {this.getAllStatisticsStatus = BlocStatus.notInitialized,
      this.getAllCarouselImageStatus = BlocStatus.notInitialized,
      this.message,
      final List<UserModel>? listStatistics,
      final List<UserModel>? listSortUsers,
      final List<AdvertisingModel>? listAdvertisiong})
      : _listStatistics = listStatistics,
        _listSortUsers = listSortUsers,
        _listAdvertisiong = listAdvertisiong,
        super._();

  @override
  @JsonKey()
  final BlocStatus getAllStatisticsStatus;
  @override
  @JsonKey()
  final BlocStatus getAllCarouselImageStatus;
  @override
  final String? message;
  final List<UserModel>? _listStatistics;
  @override
  List<UserModel>? get listStatistics {
    final value = _listStatistics;
    if (value == null) return null;
    if (_listStatistics is EqualUnmodifiableListView) return _listStatistics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<UserModel>? _listSortUsers;
  @override
  List<UserModel>? get listSortUsers {
    final value = _listSortUsers;
    if (value == null) return null;
    if (_listSortUsers is EqualUnmodifiableListView) return _listSortUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<AdvertisingModel>? _listAdvertisiong;
  @override
  List<AdvertisingModel>? get listAdvertisiong {
    final value = _listAdvertisiong;
    if (value == null) return null;
    if (_listAdvertisiong is EqualUnmodifiableListView)
      return _listAdvertisiong;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'HomeState(getAllStatisticsStatus: $getAllStatisticsStatus, getAllCarouselImageStatus: $getAllCarouselImageStatus, message: $message, listStatistics: $listStatistics, listSortUsers: $listSortUsers, listAdvertisiong: $listAdvertisiong)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.getAllStatisticsStatus, getAllStatisticsStatus) ||
                other.getAllStatisticsStatus == getAllStatisticsStatus) &&
            (identical(other.getAllCarouselImageStatus,
                    getAllCarouselImageStatus) ||
                other.getAllCarouselImageStatus == getAllCarouselImageStatus) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._listStatistics, _listStatistics) &&
            const DeepCollectionEquality()
                .equals(other._listSortUsers, _listSortUsers) &&
            const DeepCollectionEquality()
                .equals(other._listAdvertisiong, _listAdvertisiong));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      getAllStatisticsStatus,
      getAllCarouselImageStatus,
      message,
      const DeepCollectionEquality().hash(_listStatistics),
      const DeepCollectionEquality().hash(_listSortUsers),
      const DeepCollectionEquality().hash(_listAdvertisiong));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState extends HomeState {
  const factory _HomeState(
      {final BlocStatus getAllStatisticsStatus,
      final BlocStatus getAllCarouselImageStatus,
      final String? message,
      final List<UserModel>? listStatistics,
      final List<UserModel>? listSortUsers,
      final List<AdvertisingModel>? listAdvertisiong}) = _$HomeStateImpl;
  const _HomeState._() : super._();

  @override
  BlocStatus get getAllStatisticsStatus;
  @override
  BlocStatus get getAllCarouselImageStatus;
  @override
  String? get message;
  @override
  List<UserModel>? get listStatistics;
  @override
  List<UserModel>? get listSortUsers;
  @override
  List<AdvertisingModel>? get listAdvertisiong;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
