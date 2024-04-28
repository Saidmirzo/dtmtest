import 'package:bloc/bloc.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/features/mobile/tests/data/models/history_model.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tests_event.dart';
part 'tests_state.dart';
part 'tests_bloc.freezed.dart';

class TestsBloc extends Bloc<TestsEvent, TestsState> {
  HistoryModel historyModel = HistoryModel();
  TestsBloc() : super(const TestsState()) {
    on<TestsEvent>((event, emit) {});
    on<AddHistorEvent>(_addHistoryEvent);
    on<SaveToHistoryEvent>(_closeTestEvent);
  }
  _addHistoryEvent(AddHistorEvent event, emit) {}
  _closeTestEvent(event, emit)async{

  }
}
