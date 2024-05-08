// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tarifs_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TarifsState {
  BlocStatus get getTarifsStatus => throw _privateConstructorUsedError;
  BlocStatus get getAllPlansStatus => throw _privateConstructorUsedError;
  BlocStatus get addPlanStatus => throw _privateConstructorUsedError;
  BlocStatus get deletePlanStatus => throw _privateConstructorUsedError;
  BlocStatus get editPlanStatus => throw _privateConstructorUsedError;
  List<PlanModel>? get listPlans => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TarifsStateCopyWith<TarifsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TarifsStateCopyWith<$Res> {
  factory $TarifsStateCopyWith(
          TarifsState value, $Res Function(TarifsState) then) =
      _$TarifsStateCopyWithImpl<$Res, TarifsState>;
  @useResult
  $Res call(
      {BlocStatus getTarifsStatus,
      BlocStatus getAllPlansStatus,
      BlocStatus addPlanStatus,
      BlocStatus deletePlanStatus,
      BlocStatus editPlanStatus,
      List<PlanModel>? listPlans,
      String? message});
}

/// @nodoc
class _$TarifsStateCopyWithImpl<$Res, $Val extends TarifsState>
    implements $TarifsStateCopyWith<$Res> {
  _$TarifsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getTarifsStatus = null,
    Object? getAllPlansStatus = null,
    Object? addPlanStatus = null,
    Object? deletePlanStatus = null,
    Object? editPlanStatus = null,
    Object? listPlans = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      getTarifsStatus: null == getTarifsStatus
          ? _value.getTarifsStatus
          : getTarifsStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      getAllPlansStatus: null == getAllPlansStatus
          ? _value.getAllPlansStatus
          : getAllPlansStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      addPlanStatus: null == addPlanStatus
          ? _value.addPlanStatus
          : addPlanStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      deletePlanStatus: null == deletePlanStatus
          ? _value.deletePlanStatus
          : deletePlanStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      editPlanStatus: null == editPlanStatus
          ? _value.editPlanStatus
          : editPlanStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      listPlans: freezed == listPlans
          ? _value.listPlans
          : listPlans // ignore: cast_nullable_to_non_nullable
              as List<PlanModel>?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TarifsStateImplCopyWith<$Res>
    implements $TarifsStateCopyWith<$Res> {
  factory _$$TarifsStateImplCopyWith(
          _$TarifsStateImpl value, $Res Function(_$TarifsStateImpl) then) =
      __$$TarifsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BlocStatus getTarifsStatus,
      BlocStatus getAllPlansStatus,
      BlocStatus addPlanStatus,
      BlocStatus deletePlanStatus,
      BlocStatus editPlanStatus,
      List<PlanModel>? listPlans,
      String? message});
}

/// @nodoc
class __$$TarifsStateImplCopyWithImpl<$Res>
    extends _$TarifsStateCopyWithImpl<$Res, _$TarifsStateImpl>
    implements _$$TarifsStateImplCopyWith<$Res> {
  __$$TarifsStateImplCopyWithImpl(
      _$TarifsStateImpl _value, $Res Function(_$TarifsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getTarifsStatus = null,
    Object? getAllPlansStatus = null,
    Object? addPlanStatus = null,
    Object? deletePlanStatus = null,
    Object? editPlanStatus = null,
    Object? listPlans = freezed,
    Object? message = freezed,
  }) {
    return _then(_$TarifsStateImpl(
      getTarifsStatus: null == getTarifsStatus
          ? _value.getTarifsStatus
          : getTarifsStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      getAllPlansStatus: null == getAllPlansStatus
          ? _value.getAllPlansStatus
          : getAllPlansStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      addPlanStatus: null == addPlanStatus
          ? _value.addPlanStatus
          : addPlanStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      deletePlanStatus: null == deletePlanStatus
          ? _value.deletePlanStatus
          : deletePlanStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      editPlanStatus: null == editPlanStatus
          ? _value.editPlanStatus
          : editPlanStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      listPlans: freezed == listPlans
          ? _value._listPlans
          : listPlans // ignore: cast_nullable_to_non_nullable
              as List<PlanModel>?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TarifsStateImpl extends _TarifsState {
  const _$TarifsStateImpl(
      {this.getTarifsStatus = BlocStatus.notInitialized,
      this.getAllPlansStatus = BlocStatus.notInitialized,
      this.addPlanStatus = BlocStatus.notInitialized,
      this.deletePlanStatus = BlocStatus.notInitialized,
      this.editPlanStatus = BlocStatus.notInitialized,
      final List<PlanModel>? listPlans,
      this.message})
      : _listPlans = listPlans,
        super._();

  @override
  @JsonKey()
  final BlocStatus getTarifsStatus;
  @override
  @JsonKey()
  final BlocStatus getAllPlansStatus;
  @override
  @JsonKey()
  final BlocStatus addPlanStatus;
  @override
  @JsonKey()
  final BlocStatus deletePlanStatus;
  @override
  @JsonKey()
  final BlocStatus editPlanStatus;
  final List<PlanModel>? _listPlans;
  @override
  List<PlanModel>? get listPlans {
    final value = _listPlans;
    if (value == null) return null;
    if (_listPlans is EqualUnmodifiableListView) return _listPlans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? message;

  @override
  String toString() {
    return 'TarifsState(getTarifsStatus: $getTarifsStatus, getAllPlansStatus: $getAllPlansStatus, addPlanStatus: $addPlanStatus, deletePlanStatus: $deletePlanStatus, editPlanStatus: $editPlanStatus, listPlans: $listPlans, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TarifsStateImpl &&
            (identical(other.getTarifsStatus, getTarifsStatus) ||
                other.getTarifsStatus == getTarifsStatus) &&
            (identical(other.getAllPlansStatus, getAllPlansStatus) ||
                other.getAllPlansStatus == getAllPlansStatus) &&
            (identical(other.addPlanStatus, addPlanStatus) ||
                other.addPlanStatus == addPlanStatus) &&
            (identical(other.deletePlanStatus, deletePlanStatus) ||
                other.deletePlanStatus == deletePlanStatus) &&
            (identical(other.editPlanStatus, editPlanStatus) ||
                other.editPlanStatus == editPlanStatus) &&
            const DeepCollectionEquality()
                .equals(other._listPlans, _listPlans) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      getTarifsStatus,
      getAllPlansStatus,
      addPlanStatus,
      deletePlanStatus,
      editPlanStatus,
      const DeepCollectionEquality().hash(_listPlans),
      message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TarifsStateImplCopyWith<_$TarifsStateImpl> get copyWith =>
      __$$TarifsStateImplCopyWithImpl<_$TarifsStateImpl>(this, _$identity);
}

abstract class _TarifsState extends TarifsState {
  const factory _TarifsState(
      {final BlocStatus getTarifsStatus,
      final BlocStatus getAllPlansStatus,
      final BlocStatus addPlanStatus,
      final BlocStatus deletePlanStatus,
      final BlocStatus editPlanStatus,
      final List<PlanModel>? listPlans,
      final String? message}) = _$TarifsStateImpl;
  const _TarifsState._() : super._();

  @override
  BlocStatus get getTarifsStatus;
  @override
  BlocStatus get getAllPlansStatus;
  @override
  BlocStatus get addPlanStatus;
  @override
  BlocStatus get deletePlanStatus;
  @override
  BlocStatus get editPlanStatus;
  @override
  List<PlanModel>? get listPlans;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$TarifsStateImplCopyWith<_$TarifsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
