part of 'profile_bloc.dart';

class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetProfileDataEvent extends ProfileEvent {}

class UpdateProfileDataEvent extends ProfileEvent {
  UpdateProfileDataEvent({required this.model});
  final UserModel model;
}
