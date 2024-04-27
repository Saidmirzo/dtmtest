part of 'history_bloc.dart';

@freezed
class HistoryState with _$HistoryState {
  const factory HistoryState(
 {  @Default(BlocStatus.notInitialized) final BlocStatus getAllHistoryStatus,
    final String? message,
    final List<HistoryModel>? listHistory,}
  ) = _HistoryState;
  const HistoryState._();
}
