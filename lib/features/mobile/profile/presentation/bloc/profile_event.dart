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
class ProfileUpdateImageEvent extends ProfileEvent {
  final Uint8List byte;
  final String name, publicId;
   ProfileUpdateImageEvent({
    required this.byte,
    required this.name,
    required this.publicId,
  });
}
class ProfileUploadImageEvent extends ProfileEvent {
  final Uint8List byte;
  final String name;
   ProfileUploadImageEvent({required this.byte, required this.name});
}