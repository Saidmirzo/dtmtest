part of 'web_users_bloc.dart';

sealed class WebUsersEvent extends Equatable {
  const WebUsersEvent();

  @override
  List<Object> get props => [];
}

class GetAdminsEvent extends WebUsersEvent {}

class DeleteAdminEvent extends WebUsersEvent {}

class AddAdminEvent extends WebUsersEvent {}

class EditAdminEvent extends WebUsersEvent {}

class GetUsersEvent extends WebUsersEvent {}

class DeleteUserEvent extends WebUsersEvent {
  const DeleteUserEvent({required this.model});
  final UserModel? model;
}
