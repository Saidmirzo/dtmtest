part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginWithGoogleEvent extends AuthEvent {}

class GetLocaleUserEvent extends AuthEvent {}

class LogOutEvent extends AuthEvent {}

class RegisterUserEvent extends AuthEvent {
  final UserRegisterModel userRegisterModel;
  const RegisterUserEvent({required this.userRegisterModel});
}

class LoginWithEmailEvent extends AuthEvent {
  final UserRegisterModel userRegisterModel;
  const LoginWithEmailEvent({required this.userRegisterModel});
}
