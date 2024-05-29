part of 'web_quizs_bloc.dart';

class WebQuizsEvent extends Equatable {
  const WebQuizsEvent();
  @override
  List<Object?> get props => [];
}

class GetAllQuizCategoryEvent extends WebQuizsEvent {}

// ignore: must_be_immutable
class GetAllQuizThemesEvent extends WebQuizsEvent {
  String id;
  GetAllQuizThemesEvent({required this.id});
}

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

class DeleteQuizThemeEvent extends WebQuizsEvent {
  const DeleteQuizThemeEvent({required this.idCategory, required this.idTheme});
  final String idCategory;
  final String idTheme;
}

class EditQuizThemeEvent extends WebQuizsEvent {
  const EditQuizThemeEvent({required this.categoryId, required this.model});

  final ThemeModel model;
  final String categoryId;
}
