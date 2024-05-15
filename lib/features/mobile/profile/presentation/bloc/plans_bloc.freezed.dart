// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plans_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PlansState {
  BlocStatus get getAllPlanStatus => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<PlanModel>? get listCategories => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlansStateCopyWith<PlansState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlansStateCopyWith<$Res> {
  factory $PlansStateCopyWith(
          PlansState value, $Res Function(PlansState) then) =
      _$PlansStateCopyWithImpl<$Res, PlansState>;
  @useResult
  $Res call(
      {BlocStatus getAllPlanStatus,
      String? message,
      List<PlanModel>? listCategories});
}

/// @nodoc
class _$PlansStateCopyWithImpl<$Res, $Val extends PlansState>
    implements $PlansStateCopyWith<$Res> {
  _$PlansStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getAllPlanStatus = null,
    Object? message = freezed,
    Object? listCategories = freezed,
  }) {
    return _then(_value.copyWith(
      getAllPlanStatus: null == getAllPlanStatus
          ? _value.getAllPlanStatus
          : getAllPlanStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      listCategories: freezed == listCategories
          ? _value.listCategories
          : listCategories // ignore: cast_nullable_to_non_nullable
              as List<PlanModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlansStateImplCopyWith<$Res>
    implements $PlansStateCopyWith<$Res> {
  factory _$$PlansStateImplCopyWith(
          _$PlansStateImpl value, $Res Function(_$PlansStateImpl) then) =
      __$$PlansStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BlocStatus getAllPlanStatus,
      String? message,
      List<PlanModel>? listCategories});
}

/// @nodoc
class __$$PlansStateImplCopyWithImpl<$Res>
    extends _$PlansStateCopyWithImpl<$Res, _$PlansStateImpl>
    implements _$$PlansStateImplCopyWith<$Res> {
  __$$PlansStateImplCopyWithImpl(
      _$PlansStateImpl _value, $Res Function(_$PlansStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getAllPlanStatus = null,
    Object? message = freezed,
    Object? listCategories = freezed,
  }) {
    return _then(_$PlansStateImpl(
      getAllPlanStatus: null == getAllPlanStatus
          ? _value.getAllPlanStatus
          : getAllPlanStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      listCategories: freezed == listCategories
          ? _value._listCategories
          : listCategories // ignore: cast_nullable_to_non_nullable
              as List<PlanModel>?,
    ));
  }
}

/// @nodoc

class _$PlansStateImpl extends _PlansState {
  const _$PlansStateImpl(
      {this.getAllPlanStatus = BlocStatus.notInitialized,
      this.message,
      final List<PlanModel>? listCategories})
      : _listCategories = listCategories,
        super._();

  @override
  @JsonKey()
  final BlocStatus getAllPlanStatus;
  @override
  final String? message;
  final List<PlanModel>? _listCategories;
  @override
  List<PlanModel>? get listCategories {
    final value = _listCategories;
    if (value == null) return null;
    if (_listCategories is EqualUnmodifiableListView) return _listCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PlansState(getAllPlanStatus: $getAllPlanStatus, message: $message, listCategories: $listCategories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlansStateImpl &&
            (identical(other.getAllPlanStatus, getAllPlanStatus) ||
                other.getAllPlanStatus == getAllPlanStatus) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._listCategories, _listCategories));
  }

  @override
  int get hashCode => Object.hash(runtimeType, getAllPlanStatus, message,
      const DeepCollectionEquality().hash(_listCategories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlansStateImplCopyWith<_$PlansStateImpl> get copyWith =>
      __$$PlansStateImplCopyWithImpl<_$PlansStateImpl>(this, _$identity);
}

abstract class _PlansState extends PlansState {
  const factory _PlansState(
      {final BlocStatus getAllPlanStatus,
      final String? message,
      final List<PlanModel>? listCategories}) = _$PlansStateImpl;
  const _PlansState._() : super._();

  @override
  BlocStatus get getAllPlanStatus;
  @override
  String? get message;
  @override
  List<PlanModel>? get listCategories;
  @override
  @JsonKey(ignore: true)
  _$$PlansStateImplCopyWith<_$PlansStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
