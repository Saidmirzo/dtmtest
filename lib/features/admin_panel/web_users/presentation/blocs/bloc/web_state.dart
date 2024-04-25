part of 'web_bloc.dart';

@freezed

 class WebState with _$WebState {
  const factory WebState({
    @Default(BlocStatus.notInitialized) final BlocStatus getAllUsersStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus getAllThemesStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus addNewThemeStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus addNewadvertisingStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus getAllAdvertisingStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus getAllPlansStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus addPlanStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus deletePlanStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus editPlanStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus addCategoryStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus getAllCategoriesStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus deleteCategoryStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus editategoryStatus,
    final List<CategoryModel>? listCategories,
    final String? message,
    final List<UserModel>? listUsers,
    final List<ThemeModel>? listThemes,
    final List<AdvertisingModel>? listAdvertising,
    final List<PlanModel>? listPlans,

  })=_WebState;

  const WebState._();
  
 
}

