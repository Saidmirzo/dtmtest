// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HistoryState {
  BlocStatus get getAllHistoryStatus => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<HistoryModel>? get listHistory => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HistoryStateCopyWith<HistoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryStateCopyWith<$Res> {
  factory $HistoryStateCopyWith(
          HistoryState value, $Res Function(HistoryState) then) =
      _$HistoryStateCopyWithImpl<$Res, HistoryState>;
  @useResult
  $Res call(
      {BlocStatus getAllHistoryStatus,
      String? message,
      List<HistoryModel>? listHistory});
}

/// @nodoc
class _$HistoryStateCopyWithImpl<$Res, $Val extends HistoryState>
    implements $HistoryStateCopyWith<$Res> {
  _$HistoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getAllHistoryStatus = null,
    Object? message = freezed,
    Object? listHistory = freezed,
  }) {
    return _then(_value.copyWith(
      getAllHistoryStatus: null == getAllHistoryStatus
          ? _value.getAllHistoryStatus
          : getAllHistoryStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      listHistory: freezed == listHistory
          ? _value.listHistory
          : listHistory // ignore: cast_nullable_to_non_nullable
              as List<HistoryModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HistoryStateImplCopyWith<$Res>
    implements $HistoryStateCopyWith<$Res> {
  factory _$$HistoryStateImplCopyWith(
          _$HistoryStateImpl value, $Res Function(_$HistoryStateImpl) then) =
      __$$HistoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BlocStatus getAllHistoryStatus,
      String? message,
      List<HistoryModel>? listHistory});
}

/// @nodoc
class __$$HistoryStateImplCopyWithImpl<$Res>
    extends _$HistoryStateCopyWithImpl<$Res, _$HistoryStateImpl>
    implements _$$HistoryStateImplCopyWith<$Res> {
  __$$HistoryStateImplCopyWithImpl(
      _$HistoryStateImpl _value, $Res Function(_$HistoryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getAllHistoryStatus = null,
    Object? message = freezed,
    Object? listHistory = freezed,
  }) {
    return _then(_$HistoryStateImpl(
      getAllHistoryStatus: null == getAllHistoryStatus
          ? _value.getAllHistoryStatus
          : getAllHistoryStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      listHistory: freezed == listHistory
          ? _value._listHistory
          : listHistory // ignore: cast_nullable_to_non_nullable
              as List<HistoryModel>?,
    ));
  }
}

/// @nodoc

class _$HistoryStateImpl extends _HistoryState {
  const _$HistoryStateImpl(
      {this.getAllHistoryStatus = BlocStatus.notInitialized,
      this.message,
      final List<HistoryModel>? listHistory})
      : _listHistory = listHistory,
        super._();

  @override
  @JsonKey()
  final BlocStatus getAllHistoryStatus;
  @override
  final String? message;
  final List<HistoryModel>? _listHistory;
  @override
  List<HistoryModel>? get listHistory {
    final value = _listHistory;
    if (value == null) return null;
    if (_listHistory is EqualUnmodifiableListView) return _listHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'HistoryState(getAllHistoryStatus: $getAllHistoryStatus, message: $message, listHistory: $listHistory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryStateImpl &&
            (identical(other.getAllHistoryStatus, getAllHistoryStatus) ||
                other.getAllHistoryStatus == getAllHistoryStatus) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._listHistory, _listHistory));
  }

  @override
  int get hashCode => Object.hash(runtimeType, getAllHistoryStatus, message,
      const DeepCollectionEquality().hash(_listHistory));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryStateImplCopyWith<_$HistoryStateImpl> get copyWith =>
      __$$HistoryStateImplCopyWithImpl<_$HistoryStateImpl>(this, _$identity);
}

abstract class _HistoryState extends HistoryState {
  const factory _HistoryState(
      {final BlocStatus getAllHistoryStatus,
      final String? message,
      final List<HistoryModel>? listHistory}) = _$HistoryStateImpl;
  const _HistoryState._() : super._();

  @override
  BlocStatus get getAllHistoryStatus;
  @override
  String? get message;
  @override
  List<HistoryModel>? get listHistory;
  @override
  @JsonKey(ignore: true)
  _$$HistoryStateImplCopyWith<_$HistoryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
