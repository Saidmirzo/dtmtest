import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/features/mobile/auth/data/model/user_model.dart';
import 'package:dtmtest/features/mobile/auth/domain/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(const AuthState()) {
    on<AuthEvent>((event, emit) {});
    on<LoginWithGoogleEvent>(_loginWithGoogleEvent);
    on<GetLocaleUserEvent>(_getLocaleUserEvent);
    on<LogOutEvent>(_logOut);
  }
  _loginWithGoogleEvent(event, emit) async {
    emit(state.copyWith(loginWithGoogleStaus: BlocStatus.inProgress));
    final result = await authRepository.loginWithGoogle();
    result.fold(
      (l) => emit(
        state.copyWith(
          loginWithGoogleStaus: BlocStatus.failed,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(loginWithGoogleStaus: BlocStatus.completed),
      ),
    );
  }

  _getLocaleUserEvent(event, emit) async {
    emit(state.copyWith(getLocaleUserStatus: BlocStatus.inProgress));
    final result = await authRepository.getLocaleUserModel();
    result.fold(
      (l) => emit(
        state.copyWith(
          getLocaleUserStatus: BlocStatus.failed,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          getLocaleUserStatus: BlocStatus.completed,
          userModel: r,
        ),
      ),
    );
  }

  _logOut(event, emit) async {
    emit(state.copyWith(logOutStatus: BlocStatus.inProgress));
    final result = await authRepository.logOut();
    result.fold(
      (l) => emit(
        state.copyWith(
          logOutStatus: BlocStatus.failed,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(logOutStatus: BlocStatus.completed),
      ),
    );
  }
}
