// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'web_categories_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WebCategoriesState {
  BlocStatus get addCategoryStatus => throw _privateConstructorUsedError;
  BlocStatus get getAllCategoriesStatus => throw _privateConstructorUsedError;
  BlocStatus get deleteCategoryStatus => throw _privateConstructorUsedError;
  BlocStatus get editategoryStatus => throw _privateConstructorUsedError;
  List<CategoryModel>? get listCategories => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WebCategoriesStateCopyWith<WebCategoriesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebCategoriesStateCopyWith<$Res> {
  factory $WebCategoriesStateCopyWith(
          WebCategoriesState value, $Res Function(WebCategoriesState) then) =
      _$WebCategoriesStateCopyWithImpl<$Res, WebCategoriesState>;
  @useResult
  $Res call(
      {BlocStatus addCategoryStatus,
      BlocStatus getAllCategoriesStatus,
      BlocStatus deleteCategoryStatus,
      BlocStatus editategoryStatus,
      List<CategoryModel>? listCategories,
      String? message});
}

/// @nodoc
class _$WebCategoriesStateCopyWithImpl<$Res, $Val extends WebCategoriesState>
    implements $WebCategoriesStateCopyWith<$Res> {
  _$WebCategoriesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addCategoryStatus = null,
    Object? getAllCategoriesStatus = null,
    Object? deleteCategoryStatus = null,
    Object? editategoryStatus = null,
    Object? listCategories = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      addCategoryStatus: null == addCategoryStatus
          ? _value.addCategoryStatus
          : addCategoryStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      getAllCategoriesStatus: null == getAllCategoriesStatus
          ? _value.getAllCategoriesStatus
          : getAllCategoriesStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      deleteCategoryStatus: null == deleteCategoryStatus
          ? _value.deleteCategoryStatus
          : deleteCategoryStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      editategoryStatus: null == editategoryStatus
          ? _value.editategoryStatus
          : editategoryStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      listCategories: freezed == listCategories
          ? _value.listCategories
          : listCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WebCategoriesStateImplCopyWith<$Res>
    implements $WebCategoriesStateCopyWith<$Res> {
  factory _$$WebCategoriesStateImplCopyWith(_$WebCategoriesStateImpl value,
          $Res Function(_$WebCategoriesStateImpl) then) =
      __$$WebCategoriesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BlocStatus addCategoryStatus,
      BlocStatus getAllCategoriesStatus,
      BlocStatus deleteCategoryStatus,
      BlocStatus editategoryStatus,
      List<CategoryModel>? listCategories,
      String? message});
}

/// @nodoc
class __$$WebCategoriesStateImplCopyWithImpl<$Res>
    extends _$WebCategoriesStateCopyWithImpl<$Res, _$WebCategoriesStateImpl>
    implements _$$WebCategoriesStateImplCopyWith<$Res> {
  __$$WebCategoriesStateImplCopyWithImpl(_$WebCategoriesStateImpl _value,
      $Res Function(_$WebCategoriesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addCategoryStatus = null,
    Object? getAllCategoriesStatus = null,
    Object? deleteCategoryStatus = null,
    Object? editategoryStatus = null,
    Object? listCategories = freezed,
    Object? message = freezed,
  }) {
    return _then(_$WebCategoriesStateImpl(
      addCategoryStatus: null == addCategoryStatus
          ? _value.addCategoryStatus
          : addCategoryStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      getAllCategoriesStatus: null == getAllCategoriesStatus
          ? _value.getAllCategoriesStatus
          : getAllCategoriesStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      deleteCategoryStatus: null == deleteCategoryStatus
          ? _value.deleteCategoryStatus
          : deleteCategoryStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      editategoryStatus: null == editategoryStatus
          ? _value.editategoryStatus
          : editategoryStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      listCategories: freezed == listCategories
          ? _value._listCategories
          : listCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$WebCategoriesStateImpl extends _WebCategoriesState {
  const _$WebCategoriesStateImpl(
      {this.addCategoryStatus = BlocStatus.notInitialized,
      this.getAllCategoriesStatus = BlocStatus.notInitialized,
      this.deleteCategoryStatus = BlocStatus.notInitialized,
      this.editategoryStatus = BlocStatus.notInitialized,
      final List<CategoryModel>? listCategories,
      this.message})
      : _listCategories = listCategories,
        super._();

  @override
  @JsonKey()
  final BlocStatus addCategoryStatus;
  @override
  @JsonKey()
  final BlocStatus getAllCategoriesStatus;
  @override
  @JsonKey()
  final BlocStatus deleteCategoryStatus;
  @override
  @JsonKey()
  final BlocStatus editategoryStatus;
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
  final String? message;

  @override
  String toString() {
    return 'WebCategoriesState(addCategoryStatus: $addCategoryStatus, getAllCategoriesStatus: $getAllCategoriesStatus, deleteCategoryStatus: $deleteCategoryStatus, editategoryStatus: $editategoryStatus, listCategories: $listCategories, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WebCategoriesStateImpl &&
            (identical(other.addCategoryStatus, addCategoryStatus) ||
                other.addCategoryStatus == addCategoryStatus) &&
            (identical(other.getAllCategoriesStatus, getAllCategoriesStatus) ||
                other.getAllCategoriesStatus == getAllCategoriesStatus) &&
            (identical(other.deleteCategoryStatus, deleteCategoryStatus) ||
                other.deleteCategoryStatus == deleteCategoryStatus) &&
            (identical(other.editategoryStatus, editategoryStatus) ||
                other.editategoryStatus == editategoryStatus) &&
            const DeepCollectionEquality()
                .equals(other._listCategories, _listCategories) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      addCategoryStatus,
      getAllCategoriesStatus,
      deleteCategoryStatus,
      editategoryStatus,
      const DeepCollectionEquality().hash(_listCategories),
      message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WebCategoriesStateImplCopyWith<_$WebCategoriesStateImpl> get copyWith =>
      __$$WebCategoriesStateImplCopyWithImpl<_$WebCategoriesStateImpl>(
          this, _$identity);
}

abstract class _WebCategoriesState extends WebCategoriesState {
  const factory _WebCategoriesState(
      {final BlocStatus addCategoryStatus,
      final BlocStatus getAllCategoriesStatus,
      final BlocStatus deleteCategoryStatus,
      final BlocStatus editategoryStatus,
      final List<CategoryModel>? listCategories,
      final String? message}) = _$WebCategoriesStateImpl;
  const _WebCategoriesState._() : super._();

  @override
  BlocStatus get addCategoryStatus;
  @override
  BlocStatus get getAllCategoriesStatus;
  @override
  BlocStatus get deleteCategoryStatus;
  @override
  BlocStatus get editategoryStatus;
  @override
  List<CategoryModel>? get listCategories;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$WebCategoriesStateImplCopyWith<_$WebCategoriesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
