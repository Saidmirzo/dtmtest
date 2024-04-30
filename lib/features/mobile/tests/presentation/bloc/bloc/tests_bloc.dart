import 'package:bloc/bloc.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/features/mobile/tests/data/models/history_model.dart';
import 'package:dtmtest/features/mobile/tests/domain/repository/tests_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tests_event.dart';
part 'tests_state.dart';
part 'tests_bloc.freezed.dart';

class TestsBloc extends Bloc<TestsEvent, TestsState> {
  final TestsRepository testsRepository;
  TestsBloc({required this.testsRepository}) : super(const TestsState()) {
    on<TestsEvent>((event, emit) {});
    on<AddHistorEvent>(_addHistoryEvent);
    on<SaveToHistoryEvent>(_saveToHistoryEvent);
  }
  _addHistoryEvent(AddHistorEvent event, emit) {}
  _saveToHistoryEvent(SaveToHistoryEvent event, emit) async {
    emit(state.copyWith(saveToHistoryStatus: BlocStatus.inProgress));
    final result = await testsRepository.saveToHistory(event.historyModel);
    result.fold(
      (l) => emit(
        state.copyWith(
          saveToHistoryStatus: BlocStatus.failed,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(saveToHistoryStatus: BlocStatus.completed),
      ),
    );
  }
}
