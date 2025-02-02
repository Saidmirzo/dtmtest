part of 'tests_bloc.dart';

@freezed
sealed class TestsState with _$TestsState {
  const factory TestsState({
    @Default(BlocStatus.notInitialized) final BlocStatus saveToHistoryStatus,
    final String? message,
  }) = _TestsState;

  const TestsState._();
}
