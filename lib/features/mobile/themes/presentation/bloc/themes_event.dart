part of 'themes_bloc.dart';

sealed class ThemesEvent extends Equatable {
  const ThemesEvent();

  @override
  List<Object> get props => [];
}

class GetThemesEvent extends ThemesEvent {
  final String id;
  const GetThemesEvent({required this.id});
}
