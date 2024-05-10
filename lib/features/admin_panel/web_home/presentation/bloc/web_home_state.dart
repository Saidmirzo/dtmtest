part of 'web_home_bloc.dart';

@freezed
class WebHomeState with _$WebHomeState {
  const factory WebHomeState({
    @Default(BlocStatus.notInitialized) final BlocStatus getHomeDetailStatus,
    final HomeDetailModel? homeDetailModel,
    final String? message,
  }) = _WebHomeState;

  const WebHomeState._();
}
