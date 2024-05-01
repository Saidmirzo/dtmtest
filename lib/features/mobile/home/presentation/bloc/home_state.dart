part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(BlocStatus.notInitialized) final BlocStatus getAllStatisticsStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus getAllCarouselImageStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus getUserModelStatus,
    final String? message,
    final List<UserModel>? listStatistics,
    final UserModel? userModel,
  }) = _HomeState;

  const HomeState._();
}
