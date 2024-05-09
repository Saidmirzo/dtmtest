part of 'web_auth_bloc.dart';


@freezed

 class WebAuthState with _$WebAuthState {
  const factory WebAuthState({
    @Default(BlocStatus.notInitialized) final BlocStatus loginStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus getFromLocaleStatus,

    final String? message,
    final AdminModel? adminModel,

  })=_WebAuthState;

  const WebAuthState._();
}

