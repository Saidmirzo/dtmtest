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
  const DeleteCategoryEvent({required this.model});
  final CategoryModel? model;
}

class EditCategoryEvent extends WebCategoriesEvent {
  const EditCategoryEvent({required this.index, required this.model});
  final CategoryModel? model;
  final int index;
}