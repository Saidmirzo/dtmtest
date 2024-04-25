// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'themes_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ThemesState {
  BlocStatus get getAllThemesStatus => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<ThemeModel>? get listThemes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ThemesStateCopyWith<ThemesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemesStateCopyWith<$Res> {
  factory $ThemesStateCopyWith(
          ThemesState value, $Res Function(ThemesState) then) =
      _$ThemesStateCopyWithImpl<$Res, ThemesState>;
  @useResult
  $Res call(
      {BlocStatus getAllThemesStatus,
      String? message,
      List<ThemeModel>? listThemes});
}

/// @nodoc
class _$ThemesStateCopyWithImpl<$Res, $Val extends ThemesState>
    implements $ThemesStateCopyWith<$Res> {
  _$ThemesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getAllThemesStatus = null,
    Object? message = freezed,
    Object? listThemes = freezed,
  }) {
    return _then(_value.copyWith(
      getAllThemesStatus: null == getAllThemesStatus
          ? _value.getAllThemesStatus
          : getAllThemesStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      listThemes: freezed == listThemes
          ? _value.listThemes
          : listThemes // ignore: cast_nullable_to_non_nullable
              as List<ThemeModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThemesStateImplCopyWith<$Res>
    implements $ThemesStateCopyWith<$Res> {
  factory _$$ThemesStateImplCopyWith(
          _$ThemesStateImpl value, $Res Function(_$ThemesStateImpl) then) =
      __$$ThemesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BlocStatus getAllThemesStatus,
      String? message,
      List<ThemeModel>? listThemes});
}

/// @nodoc
class __$$ThemesStateImplCopyWithImpl<$Res>
    extends _$ThemesStateCopyWithImpl<$Res, _$ThemesStateImpl>
    implements _$$ThemesStateImplCopyWith<$Res> {
  __$$ThemesStateImplCopyWithImpl(
      _$ThemesStateImpl _value, $Res Function(_$ThemesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getAllThemesStatus = null,
    Object? message = freezed,
    Object? listThemes = freezed,
  }) {
    return _then(_$ThemesStateImpl(
      getAllThemesStatus: null == getAllThemesStatus
          ? _value.getAllThemesStatus
          : getAllThemesStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      listThemes: freezed == listThemes
          ? _value._listThemes
          : listThemes // ignore: cast_nullable_to_non_nullable
              as List<ThemeModel>?,
    ));
  }
}

/// @nodoc

class _$ThemesStateImpl extends _ThemesState {
  const _$ThemesStateImpl(
      {this.getAllThemesStatus = BlocStatus.notInitialized,
      this.message,
      final List<ThemeModel>? listThemes})
      : _listThemes = listThemes,
        super._();

  @override
  @JsonKey()
  final BlocStatus getAllThemesStatus;
  @override
  final String? message;
  final List<ThemeModel>? _listThemes;
  @override
  List<ThemeModel>? get listThemes {
    final value = _listThemes;
    if (value == null) return null;
    if (_listThemes is EqualUnmodifiableListView) return _listThemes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ThemesState(getAllThemesStatus: $getAllThemesStatus, message: $message, listThemes: $listThemes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemesStateImpl &&
            (identical(other.getAllThemesStatus, getAllThemesStatus) ||
                other.getAllThemesStatus == getAllThemesStatus) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._listThemes, _listThemes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, getAllThemesStatus, message,
      const DeepCollectionEquality().hash(_listThemes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemesStateImplCopyWith<_$ThemesStateImpl> get copyWith =>
      __$$ThemesStateImplCopyWithImpl<_$ThemesStateImpl>(this, _$identity);
}

abstract class _ThemesState extends ThemesState {
  const factory _ThemesState(
      {final BlocStatus getAllThemesStatus,
      final String? message,
      final List<ThemeModel>? listThemes}) = _$ThemesStateImpl;
  const _ThemesState._() : super._();

  @override
  BlocStatus get getAllThemesStatus;
  @override
  String? get message;
  @override
  List<ThemeModel>? get listThemes;
  @override
  @JsonKey(ignore: true)
  _$$ThemesStateImplCopyWith<_$ThemesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
