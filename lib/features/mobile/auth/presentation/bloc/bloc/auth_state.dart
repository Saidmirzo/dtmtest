part of 'auth_bloc.dart';

@freezed

class AuthState with _$AuthState {
  const factory AuthState({
    @Default(BlocStatus.notInitialized) final BlocStatus loginWithGoogleStaus,
    @Default(BlocStatus.notInitialized) final BlocStatus getLocaleUserStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus logOutStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus loginWithEmailState,
    @Default(BlocStatus.notInitialized) final BlocStatus registerWithEmailState,

    final UserModel? userModel,
    final String? message,
  }) = _AuthState;

  const AuthState._();
}
