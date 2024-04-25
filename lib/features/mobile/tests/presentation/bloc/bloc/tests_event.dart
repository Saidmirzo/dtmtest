part of 'tests_bloc.dart';

sealed class TestsEvent extends Equatable {
  const TestsEvent();

  @override
  List<Object> get props => [];
}

class AddHistorEvent extends TestsEvent {
  final QuizCollection quizCollection;
  const AddHistorEvent({required this.quizCollection});
}
