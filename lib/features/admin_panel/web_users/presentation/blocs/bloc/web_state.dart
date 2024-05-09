part of 'web_bloc.dart';

@freezed
class WebState with _$WebState {
  const factory WebState({
    @Default(BlocStatus.notInitialized) final BlocStatus getAllUsersStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus getAllThemesStatus,    
    @Default(BlocStatus.notInitialized) final BlocStatus updateImageStatus,    
    final String? message,
    final List<UserModel>? listUsers,    
  }) = _WebState;

  const WebState._();
}
