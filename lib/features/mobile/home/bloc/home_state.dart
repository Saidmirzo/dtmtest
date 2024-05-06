part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(BlocStatus.notInitialized) final BlocStatus getAllStatisticsStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus getAllCarouselImageStatus,
    final String? message,
    final List<UserModel>? listStatistics,
    final List<UserModel>? listSortUsers,
    final List<AdvertisingModel>? listAdvertisiong
  }) = _HomeState;

  const HomeState._();
}
