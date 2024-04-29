// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tests_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TestsState {
  BlocStatus get saveToHistoryStatus => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TestsStateCopyWith<TestsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestsStateCopyWith<$Res> {
  factory $TestsStateCopyWith(
          TestsState value, $Res Function(TestsState) then) =
      _$TestsStateCopyWithImpl<$Res, TestsState>;
  @useResult
  $Res call({BlocStatus saveToHistoryStatus, String? message});
}

/// @nodoc
class _$TestsStateCopyWithImpl<$Res, $Val extends TestsState>
    implements $TestsStateCopyWith<$Res> {
  _$TestsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saveToHistoryStatus = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      saveToHistoryStatus: null == saveToHistoryStatus
          ? _value.saveToHistoryStatus
          : saveToHistoryStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TestsStateImplCopyWith<$Res>
    implements $TestsStateCopyWith<$Res> {
  factory _$$TestsStateImplCopyWith(
          _$TestsStateImpl value, $Res Function(_$TestsStateImpl) then) =
      __$$TestsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BlocStatus saveToHistoryStatus, String? message});
}

/// @nodoc
class __$$TestsStateImplCopyWithImpl<$Res>
    extends _$TestsStateCopyWithImpl<$Res, _$TestsStateImpl>
    implements _$$TestsStateImplCopyWith<$Res> {
  __$$TestsStateImplCopyWithImpl(
      _$TestsStateImpl _value, $Res Function(_$TestsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saveToHistoryStatus = null,
    Object? message = freezed,
  }) {
    return _then(_$TestsStateImpl(
      saveToHistoryStatus: null == saveToHistoryStatus
          ? _value.saveToHistoryStatus
          : saveToHistoryStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TestsStateImpl extends _TestsState {
  const _$TestsStateImpl(
      {this.saveToHistoryStatus = BlocStatus.notInitialized, this.message})
      : super._();

  @override
  @JsonKey()
  final BlocStatus saveToHistoryStatus;
  @override
  final String? message;

  @override
  String toString() {
    return 'TestsState(saveToHistoryStatus: $saveToHistoryStatus, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TestsStateImpl &&
            (identical(other.saveToHistoryStatus, saveToHistoryStatus) ||
                other.saveToHistoryStatus == saveToHistoryStatus) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, saveToHistoryStatus, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TestsStateImplCopyWith<_$TestsStateImpl> get copyWith =>
      __$$TestsStateImplCopyWithImpl<_$TestsStateImpl>(this, _$identity);
}

abstract class _TestsState extends TestsState {
  const factory _TestsState(
      {final BlocStatus saveToHistoryStatus,
      final String? message}) = _$TestsStateImpl;
  const _TestsState._() : super._();

  @override
  BlocStatus get saveToHistoryStatus;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$TestsStateImplCopyWith<_$TestsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
