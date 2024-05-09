part of 'web_quizs_bloc.dart';

class WebQuizsEvent extends Equatable {
  const WebQuizsEvent();
  @override
  List<Object?> get props => [];
}

class AddQuizsEvent extends WebQuizsEvent {
  const AddQuizsEvent({required this.model});
  final CategoryModel model;
}

class GetAllQuizsEvent extends WebQuizsEvent {}

class GetAllQuizThemesEvent extends WebQuizsEvent {}

class AddNewQuizThemeEvent extends WebQuizsEvent {
  final Uint8List filePath;
  final String name;
  final String categoryId;
  const AddNewQuizThemeEvent({
    required this.filePath,
    required this.name,
    required this.categoryId,
  });
}

class DeleteQuizsEvent extends WebQuizsEvent {
  const DeleteQuizsEvent({required this.model});
  final CategoryModel? model;
}

class EditQuizsEvent extends WebQuizsEvent {
  const EditQuizsEvent({required this.index, required this.model});
  final CategoryModel? model;
  final int index;
}
