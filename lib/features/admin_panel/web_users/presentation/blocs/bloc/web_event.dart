part of 'web_bloc.dart';

sealed class WebEvent extends Equatable {
  const WebEvent();

  @override
  List<Object> get props => [];
}

class GetAllUsersEvent extends WebEvent {}
