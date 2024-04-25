part of 'category_bloc.dart';

@freezed

class CategoryState with _$CategoryState {
  const factory CategoryState({
    @Default(BlocStatus.notInitialized) final BlocStatus getAllCategoriesStatus,
    final String? message,
    final List<CategoryModel>? listCategories,
  }) = _CategoryState;

  const CategoryState._();
}
