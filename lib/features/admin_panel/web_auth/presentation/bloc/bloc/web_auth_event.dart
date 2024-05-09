part of 'web_auth_bloc.dart';

sealed class WebAuthEvent extends Equatable {
  const WebAuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends WebAuthEvent {
  AdminModel adminModel;
  LoginEvent({required this.adminModel});
}
