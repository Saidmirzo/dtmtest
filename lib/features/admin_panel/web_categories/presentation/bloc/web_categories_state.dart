part of 'web_categories_bloc.dart';

@freezed
class WebCategoriesState with _$WebCategoriesState {
  const factory WebCategoriesState({
      @Default(BlocStatus.notInitialized) final BlocStatus addCategoryStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus getAllCategoriesStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus deleteCategoryStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus editategoryStatus,
    final List<CategoryModel>? listCategories,
    final String? message,
  }) = _WebCategoriesState;
 const WebCategoriesState._();
}
