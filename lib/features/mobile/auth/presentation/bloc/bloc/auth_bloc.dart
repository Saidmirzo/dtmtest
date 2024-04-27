import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/features/mobile/auth/data/model/user_model.dart';
import 'package:dtmtest/features/mobile/auth/data/model/user_register_model.dart';
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
    on<RegisterUserEvent>(_registerUserEvent);
    on<LoginWithEmailEvent>(_loginWithEmail);
  }
  _registerUserEvent(RegisterUserEvent event, emit) async {
    emit(state.copyWith(registerWithEmailState: BlocStatus.inProgress));
    try {
      await authRepository.registerWithEmail(event.userRegisterModel);
      emit(state.copyWith(registerWithEmailState: BlocStatus.completed));
    } catch (e) {
      emit(
        state.copyWith(
          registerWithEmailState: BlocStatus.failed,
          message: e.toString(),
        ),
      );
    }
  }

  _loginWithEmail(LoginWithEmailEvent event, emit) async {
    emit(state.copyWith(loginWithEmailState: BlocStatus.inProgress));
    try {
      await authRepository.loginWithEmail(
        email: event.userRegisterModel.email,
        password: event.userRegisterModel.password,
      );

      emit(state.copyWith(loginWithEmailState: BlocStatus.completed));
    } catch (e) {
      emit(
        state.copyWith(
          loginWithEmailState: BlocStatus.failed,
          message: e.toString(),
        ),
      );
    }
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
