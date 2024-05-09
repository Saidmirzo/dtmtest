import 'package:bloc/bloc.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/features/admin_panel/web_home/data/model/home_detail_model.dart';
import 'package:dtmtest/features/admin_panel/web_home/domain/web_home_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'web_home_event.dart';
part 'web_home_state.dart';
part 'web_home_bloc.freezed.dart';

class WebHomeBloc extends Bloc<WebHomeEvent, WebHomeState> {
  WebHomeRepository webHomeRepository;
  WebHomeBloc({required this.webHomeRepository}) : super(const WebHomeState()) {
    on<WebHomeEvent>((event, emit) {});
    on<GetHomeDetailsEvent>(_getHomeDetailEvent);
  }

  _getHomeDetailEvent(event, emit) async {
    emit(state.copyWith(getHomeDetailStatus: BlocStatus.inProgress));
    final result = await webHomeRepository.getAllCounts();
    result.fold(
      (l) => emit(
        state.copyWith(getHomeDetailStatus: BlocStatus.failed),
      ),
      (r) => emit(
        state.copyWith(
          getHomeDetailStatus: BlocStatus.completed,
          homeDetailModel: r,
        ),
      ),
    );
  }
}
