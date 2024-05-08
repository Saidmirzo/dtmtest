part of 'web_admins_bloc.dart';


sealed class WebAdminsEvent extends Equatable {
   const WebAdminsEvent();

  @override
  List<Object> get props => [];
}

class GetAdminsEvent extends WebAdminsEvent {}
