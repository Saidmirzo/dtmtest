part of 'web_users_bloc.dart';

@freezed
class WebUsersState with _$WebUsersState {
  const factory WebUsersState(
  {  @Default(BlocStatus.notInitialized) final BlocStatus getAllAdminsStatus,
   @Default(BlocStatus.notInitialized) final BlocStatus getAllUsersStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus addAdminStatus,
   @Default(BlocStatus.notInitialized) final BlocStatus editAdminStatus,
   @Default(BlocStatus.notInitialized) final BlocStatus deleteAdminStatus,
   @Default(BlocStatus.notInitialized) final BlocStatus deleteUserStatus,
    final List<AdminModel>? listAdmins,
    final List<UserModel>? listUsers,
    final String? message,}
  ) = _WebUsersState;

  const WebUsersState._();
}
