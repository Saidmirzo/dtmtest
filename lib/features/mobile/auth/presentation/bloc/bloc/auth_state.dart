part of 'auth_bloc.dart';

@freezed

class AuthState with _$AuthState {
  const factory AuthState({
    @Default(BlocStatus.notInitialized) final BlocStatus loginWithGoogleStaus,
    @Default(BlocStatus.notInitialized) final BlocStatus getLocaleUserStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus logOutStatus,

    final UserModel? userModel,
    final String? message,
  }) = _AuthState;

  const AuthState._();
}
