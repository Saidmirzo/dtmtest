part of 'web_auth_bloc.dart';


@freezed

 class WebAuthState with _$WebAuthState {
  const factory WebAuthState({
    @Default(BlocStatus.notInitialized) final BlocStatus loginStatus,


    final String? message,

  })=_WebAuthState;

  const WebAuthState._();
}

