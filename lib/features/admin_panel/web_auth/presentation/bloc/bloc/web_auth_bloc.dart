import 'package:bloc/bloc.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/core/error/failure.dart';
import 'package:dtmtest/features/admin_panel/web_auth/domain/repository/web_auth_repository.dart';
import 'package:dtmtest/features/admin_panel/web_users/data/models/admin_model.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'web_auth_event.dart';
part 'web_auth_state.dart';
part 'web_auth_bloc.freezed.dart';

class WebAuthBloc extends Bloc<WebAuthEvent, WebAuthState> {
  final WebAuthRepository webAuthRepository;
  WebAuthBloc({required this.webAuthRepository}) : super(const WebAuthState()) {
    on<WebAuthEvent>((event, emit) {});
    on<LoginEvent>(_loginEvent);
  }

  _loginEvent(LoginEvent event, emit) async {
    emit(state.copyWith(loginStatus: BlocStatus.inProgress));
    final result = await webAuthRepository.loginAdmin(event.adminModel);
    result.fold(
      (l) {
        if (l is PasswordIncorrectFailure) {
          emit(state.copyWith(loginStatus: BlocStatus.incorrect));
        } else if (l is UnautorizedFailure) {
          emit(state.copyWith(loginStatus: BlocStatus.unAutorized));
        } else {
          emit(state.copyWith(loginStatus: BlocStatus.failed));
        }
      },
      (r) => emit(
        state.copyWith(loginStatus: BlocStatus.completed),
      ),
    );
  }
}
