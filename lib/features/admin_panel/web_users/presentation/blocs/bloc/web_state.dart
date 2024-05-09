part of 'web_bloc.dart';

@freezed

 class WebState with _$WebState {
  const factory WebState({
    @Default(BlocStatus.notInitialized) final BlocStatus getAllUsersStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus getAllThemesStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus addNewThemeStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus addCategoryStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus getAllCategoriesStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus deleteCategoryStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus editategoryStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus updateImageStatus,
    final List<CategoryModel>? listCategories,
    final String? message,
    final List<UserModel>? listUsers,
    final List<ThemeModel>? listThemes,

  })=_WebState;

  const WebState._();
  
 
}

