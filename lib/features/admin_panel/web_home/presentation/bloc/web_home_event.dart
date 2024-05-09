part of 'web_home_bloc.dart';

sealed class WebHomeEvent extends Equatable {
  const WebHomeEvent();

  @override
  List<Object> get props => [];
}


class GetHomeDetailsEvent extends WebHomeEvent{
  
}