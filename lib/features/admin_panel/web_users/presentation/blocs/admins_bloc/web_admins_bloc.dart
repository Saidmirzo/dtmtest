import 'package:bloc/bloc.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/features/admin_panel/web_users/data/models/admin_model.dart';
import 'package:dtmtest/features/admin_panel/web_users/domain/repositories/web_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'web_admins_bloc.freezed.dart';
part 'web_admins_event.dart';
part 'web_admins_state.dart';

class WebAdminsBloc extends Bloc<WebAdminsEvent, WebAdminsState> {
  final WebRepository webRepository;
  WebAdminsBloc({required this.webRepository}) : super(const WebAdminsState()) {
    on<GetAdminsEvent>(_getAdminsEvent);
  }

  _getAdminsEvent(event, emit) async {
    emit(state.copyWith(getAllAdminsStatus: BlocStatus.inProgress));
    final result = await webRepository.getAdmins();
    result.fold(
      (l) => emit(
        state.copyWith(
          getAllAdminsStatus: BlocStatus.failed,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          getAllAdminsStatus: BlocStatus.completed,
          listAdmins: r,
        ),
      ),
    );
  }
}
