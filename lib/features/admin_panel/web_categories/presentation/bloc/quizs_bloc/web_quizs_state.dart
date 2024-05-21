part of 'web_quizs_bloc.dart';

@freezed
class WebQuizsState with _$WebQuizsState {
  const factory WebQuizsState({
    @Default(BlocStatus.notInitialized) final BlocStatus addCategoryStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus getAllCategoriesStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus deleteCategoryStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus editCategoryStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus getAllThemesStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus addNewThemeStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus editThemeStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus deleteThemeStatus,
    final List<CategoryModel>? listCategories,
    final List<ThemeModel>? listThemes,
    final String? message,
  }) = _WebQuizsState;
 const WebQuizsState._();
}
