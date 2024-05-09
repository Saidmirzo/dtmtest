part of 'web_users_bloc.dart';

sealed class WebUsersEvent extends Equatable {
  const WebUsersEvent();

  @override
  List<Object> get props => [];
}

class GetAdminsEvent extends WebUsersEvent {}

class DeleteAdminEvent extends WebUsersEvent {
  const DeleteAdminEvent({required this.id});
  final String id;
}

class AddAdminEvent extends WebUsersEvent {
  const AddAdminEvent({required this.model});
  final AdminModel? model;
}

class EditAdminEvent extends WebUsersEvent {
  const EditAdminEvent({required this.model});
  final AdminModel? model;
}

class GetUsersEvent extends WebUsersEvent {}

class DeleteUserEvent extends WebUsersEvent {
  const DeleteUserEvent({required this.id});
  final String id;
}

class SearchChangedEvent extends WebUsersEvent {
  const SearchChangedEvent({required this.query});
  final String query;
}
