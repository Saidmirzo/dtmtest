part of 'web_admins_bloc.dart';

@freezed
class WebAdminsState with _$WebAdminsState {
  const factory WebAdminsState(
  {  @Default(BlocStatus.notInitialized) final BlocStatus getAllAdminsStatus,
    final List<AdminModel>? listAdmins,
    final String? message,}
  ) = _WebAdminsState;

  const WebAdminsState._();
}
