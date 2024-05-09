import 'package:bloc/bloc.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/features/admin_panel/web_users/data/models/admin_model.dart';
import 'package:dtmtest/features/admin_panel/web_users/domain/repositories/web_users_repository.dart';
import 'package:dtmtest/features/mobile/auth/data/model/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'web_users_bloc.freezed.dart';
part 'web_users_event.dart';
part 'web_users_state.dart';

class WebUsersBloc extends Bloc<WebUsersEvent, WebUsersState> {
  final WebUsersRepository webUsersRepository;
  WebUsersBloc({required this.webUsersRepository}) : super(const WebUsersState()) {
    on<GetAdminsEvent>(_getAdminsEvent);
  }

  _getAdminsEvent(event, emit) async {
    emit(state.copyWith(getAllAdminsStatus: BlocStatus.inProgress));
    final result = await webUsersRepository.getAdmins();
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
