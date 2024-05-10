part of 'web_categories_bloc.dart';

@freezed
class WebCategoriesState with _$WebCategoriesState {
  const factory WebCategoriesState({
    @Default(BlocStatus.notInitialized) final BlocStatus addCategoryStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus getAllCategoriesStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus deleteCategoryStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus editCategoryStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus getThemesStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus addThemeStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus editThemeStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus deleteThemeStatus,
    final List<CategoryModel>? listCategories,
    final List<ThemeModel>? listThemes,
    final String? message,
  }) = _WebCategoriesState;
 const WebCategoriesState._();
}
