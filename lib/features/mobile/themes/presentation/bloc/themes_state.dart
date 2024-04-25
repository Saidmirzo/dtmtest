part of 'themes_bloc.dart';

@freezed
class ThemesState with _$ThemesState {
    const factory ThemesState({
    @Default(BlocStatus.notInitialized) final BlocStatus getAllThemesStatus,
    final String? message,
    final List<ThemeModel>? listThemes,
  }) = _ThemesState;

  const ThemesState._();
}
