part of 'web_categories_bloc.dart';

class WebCategoriesEvent extends Equatable {
  const WebCategoriesEvent();
  @override
  List<Object?> get props => [];
}

class AddCategoryEvent extends WebCategoriesEvent {
  const AddCategoryEvent({
    required this.model,
    required this.byte,
    required this.fileName,
  });
  final CategoryModel model;
  final Uint8List byte;
  final String fileName;
}

class GetAllCategoriesEvent extends WebCategoriesEvent {}

class DeleteCategoryEvent extends WebCategoriesEvent {
  const DeleteCategoryEvent({required this.id});
  final String id;
}

class EditCategoryEvent extends WebCategoriesEvent {
   EditCategoryEvent({
    required this.model,
    this.filePath,
    this.name,
  });
  CategoryModel model;
  final Uint8List? filePath;
  final String? name;
}

class GetAllThemesEvent extends WebCategoriesEvent {
  const GetAllThemesEvent({
    required this.categoryId,
    required this.filePath,
    required this.name,
  });
  final String categoryId;
  final Uint8List filePath;
  final String name;
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
