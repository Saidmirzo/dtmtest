// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'web_admins_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WebAdminsState {
  BlocStatus get getAllAdminsStatus => throw _privateConstructorUsedError;
  List<AdminModel>? get listAdmins => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WebAdminsStateCopyWith<WebAdminsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebAdminsStateCopyWith<$Res> {
  factory $WebAdminsStateCopyWith(
          WebAdminsState value, $Res Function(WebAdminsState) then) =
      _$WebAdminsStateCopyWithImpl<$Res, WebAdminsState>;
  @useResult
  $Res call(
      {BlocStatus getAllAdminsStatus,
      List<AdminModel>? listAdmins,
      String? message});
}

/// @nodoc
class _$WebAdminsStateCopyWithImpl<$Res, $Val extends WebAdminsState>
    implements $WebAdminsStateCopyWith<$Res> {
  _$WebAdminsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getAllAdminsStatus = null,
    Object? listAdmins = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      getAllAdminsStatus: null == getAllAdminsStatus
          ? _value.getAllAdminsStatus
          : getAllAdminsStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      listAdmins: freezed == listAdmins
          ? _value.listAdmins
          : listAdmins // ignore: cast_nullable_to_non_nullable
              as List<AdminModel>?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WebAdminsStateImplCopyWith<$Res>
    implements $WebAdminsStateCopyWith<$Res> {
  factory _$$WebAdminsStateImplCopyWith(_$WebAdminsStateImpl value,
          $Res Function(_$WebAdminsStateImpl) then) =
      __$$WebAdminsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BlocStatus getAllAdminsStatus,
      List<AdminModel>? listAdmins,
      String? message});
}

/// @nodoc
class __$$WebAdminsStateImplCopyWithImpl<$Res>
    extends _$WebAdminsStateCopyWithImpl<$Res, _$WebAdminsStateImpl>
    implements _$$WebAdminsStateImplCopyWith<$Res> {
  __$$WebAdminsStateImplCopyWithImpl(
      _$WebAdminsStateImpl _value, $Res Function(_$WebAdminsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getAllAdminsStatus = null,
    Object? listAdmins = freezed,
    Object? message = freezed,
  }) {
    return _then(_$WebAdminsStateImpl(
      getAllAdminsStatus: null == getAllAdminsStatus
          ? _value.getAllAdminsStatus
          : getAllAdminsStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      listAdmins: freezed == listAdmins
          ? _value._listAdmins
          : listAdmins // ignore: cast_nullable_to_non_nullable
              as List<AdminModel>?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$WebAdminsStateImpl extends _WebAdminsState {
  const _$WebAdminsStateImpl(
      {this.getAllAdminsStatus = BlocStatus.notInitialized,
      final List<AdminModel>? listAdmins,
      this.message})
      : _listAdmins = listAdmins,
        super._();

  @override
  @JsonKey()
  final BlocStatus getAllAdminsStatus;
  final List<AdminModel>? _listAdmins;
  @override
  List<AdminModel>? get listAdmins {
    final value = _listAdmins;
    if (value == null) return null;
    if (_listAdmins is EqualUnmodifiableListView) return _listAdmins;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? message;

  @override
  String toString() {
    return 'WebAdminsState(getAllAdminsStatus: $getAllAdminsStatus, listAdmins: $listAdmins, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WebAdminsStateImpl &&
            (identical(other.getAllAdminsStatus, getAllAdminsStatus) ||
                other.getAllAdminsStatus == getAllAdminsStatus) &&
            const DeepCollectionEquality()
                .equals(other._listAdmins, _listAdmins) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, getAllAdminsStatus,
      const DeepCollectionEquality().hash(_listAdmins), message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WebAdminsStateImplCopyWith<_$WebAdminsStateImpl> get copyWith =>
      __$$WebAdminsStateImplCopyWithImpl<_$WebAdminsStateImpl>(
          this, _$identity);
}

abstract class _WebAdminsState extends WebAdminsState {
  const factory _WebAdminsState(
      {final BlocStatus getAllAdminsStatus,
      final List<AdminModel>? listAdmins,
      final String? message}) = _$WebAdminsStateImpl;
  const _WebAdminsState._() : super._();

  @override
  BlocStatus get getAllAdminsStatus;
  @override
  List<AdminModel>? get listAdmins;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$WebAdminsStateImplCopyWith<_$WebAdminsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
