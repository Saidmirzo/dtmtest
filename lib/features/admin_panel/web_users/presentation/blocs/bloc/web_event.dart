part of 'web_bloc.dart';

sealed class WebEvent extends Equatable {
  const WebEvent();

  @override
  List<Object> get props => [];
}

class GetAllUsersEvent extends WebEvent {}

class GetAllThemes extends WebEvent {}

class AddNewThemeEvent extends WebEvent {
  final Uint8List filePath;
  final String name;
  final String categoryId;
  const AddNewThemeEvent({
    required this.filePath,
    required this.name,
    required this.categoryId,
  });
}

