part of 'home_bloc.dart';


sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetAllHomeEvent extends HomeEvent {}

class GetAllStatisticsEvent extends HomeEvent {}

class GetAllCarouselImageEvent extends HomeEvent {}

class GetUserModelEvent extends HomeEvent {}