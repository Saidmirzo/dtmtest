import 'package:bloc/bloc.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/features/admin_panel/web_users/domain/repositories/web_users_repository.dart';
import 'package:dtmtest/features/mobile/tests/data/models/history_model.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_bloc.freezed.dart';
part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final WebRepository webRepository;
  HistoryBloc({required this.webRepository}) : super(const HistoryState()) {
    on<GetAllHistoryEvent>(_getAllHistory);
  }
  _getAllHistory(event, emit) async {
    emit(state.copyWith(getAllHistoryStatus: BlocStatus.inProgress));
    final result = await webRepository.getAllHistory();
    result.fold(
      (l) => emit(
        state.copyWith(
          getAllHistoryStatus: BlocStatus.failed,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          getAllHistoryStatus: BlocStatus.completed,
          listHistory: r,
        ),
      ),
    );
  }
}
