// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CategoryState {
  BlocStatus get getAllCategoriesStatus => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<CategoryModel>? get listCategories => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryStateCopyWith<CategoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryStateCopyWith<$Res> {
  factory $CategoryStateCopyWith(
          CategoryState value, $Res Function(CategoryState) then) =
      _$CategoryStateCopyWithImpl<$Res, CategoryState>;
  @useResult
  $Res call(
      {BlocStatus getAllCategoriesStatus,
      String? message,
      List<CategoryModel>? listCategories});
}

/// @nodoc
class _$CategoryStateCopyWithImpl<$Res, $Val extends CategoryState>
    implements $CategoryStateCopyWith<$Res> {
  _$CategoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getAllCategoriesStatus = null,
    Object? message = freezed,
    Object? listCategories = freezed,
  }) {
    return _then(_value.copyWith(
      getAllCategoriesStatus: null == getAllCategoriesStatus
          ? _value.getAllCategoriesStatus
          : getAllCategoriesStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      listCategories: freezed == listCategories
          ? _value.listCategories
          : listCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryStateImplCopyWith<$Res>
    implements $CategoryStateCopyWith<$Res> {
  factory _$$CategoryStateImplCopyWith(
          _$CategoryStateImpl value, $Res Function(_$CategoryStateImpl) then) =
      __$$CategoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BlocStatus getAllCategoriesStatus,
      String? message,
      List<CategoryModel>? listCategories});
}

/// @nodoc
class __$$CategoryStateImplCopyWithImpl<$Res>
    extends _$CategoryStateCopyWithImpl<$Res, _$CategoryStateImpl>
    implements _$$CategoryStateImplCopyWith<$Res> {
  __$$CategoryStateImplCopyWithImpl(
      _$CategoryStateImpl _value, $Res Function(_$CategoryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getAllCategoriesStatus = null,
    Object? message = freezed,
    Object? listCategories = freezed,
  }) {
    return _then(_$CategoryStateImpl(
      getAllCategoriesStatus: null == getAllCategoriesStatus
          ? _value.getAllCategoriesStatus
          : getAllCategoriesStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      listCategories: freezed == listCategories
          ? _value._listCategories
          : listCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>?,
    ));
  }
}

/// @nodoc

class _$CategoryStateImpl extends _CategoryState {
  const _$CategoryStateImpl(
      {this.getAllCategoriesStatus = BlocStatus.notInitialized,
      this.message,
      final List<CategoryModel>? listCategories})
      : _listCategories = listCategories,
        super._();

  @override
  @JsonKey()
  final BlocStatus getAllCategoriesStatus;
  @override
  final String? message;
  final List<CategoryModel>? _listCategories;
  @override
  List<CategoryModel>? get listCategories {
    final value = _listCategories;
    if (value == null) return null;
    if (_listCategories is EqualUnmodifiableListView) return _listCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CategoryState(getAllCategoriesStatus: $getAllCategoriesStatus, message: $message, listCategories: $listCategories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryStateImpl &&
            (identical(other.getAllCategoriesStatus, getAllCategoriesStatus) ||
                other.getAllCategoriesStatus == getAllCategoriesStatus) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._listCategories, _listCategories));
  }

  @override
  int get hashCode => Object.hash(runtimeType, getAllCategoriesStatus, message,
      const DeepCollectionEquality().hash(_listCategories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryStateImplCopyWith<_$CategoryStateImpl> get copyWith =>
      __$$CategoryStateImplCopyWithImpl<_$CategoryStateImpl>(this, _$identity);
}

abstract class _CategoryState extends CategoryState {
  const factory _CategoryState(
      {final BlocStatus getAllCategoriesStatus,
      final String? message,
      final List<CategoryModel>? listCategories}) = _$CategoryStateImpl;
  const _CategoryState._() : super._();

  @override
  BlocStatus get getAllCategoriesStatus;
  @override
  String? get message;
  @override
  List<CategoryModel>? get listCategories;
  @override
  @JsonKey(ignore: true)
  _$$CategoryStateImplCopyWith<_$CategoryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
