part of 'web_categories_bloc.dart';

class WebCategoriesEvent extends Equatable {
  const WebCategoriesEvent();
  @override
  List<Object?> get props => [];
}

class AddCategoryEvent extends WebCategoriesEvent {
  const AddCategoryEvent({required this.model});
  final CategoryModel model;
}

class GetAllCategoriesEvent extends WebCategoriesEvent {}

class DeleteCategoryEvent extends WebCategoriesEvent {
  const DeleteCategoryEvent({required this.id});
  final String id;
}

class EditCategoryEvent extends WebCategoriesEvent {
  const EditCategoryEvent({required this.index, required this.model});
  final CategoryModel? model;
  final int index;
}

class GetAllThemesEvent extends WebCategoriesEvent {
  const GetAllThemesEvent({required this.categoryId});
  final String categoryId;
}

class AddThemeEvent extends WebCategoriesEvent {
  final Uint8List filePath;
  final String name;
  final String categoryId;
  const AddThemeEvent({
    required this.filePath,
    required this.name,
    required this.categoryId,
  });
}

class EditThemeEvent extends WebCategoriesEvent {
  const EditThemeEvent({required this.model, required this.categoryId});
  final String categoryId;
  final ThemeModel model;
}

class DeleteThemeEvent extends WebCategoriesEvent {
  const DeleteThemeEvent({required this.categoryId, required this.themeId});
  final String categoryId, themeId;
}
