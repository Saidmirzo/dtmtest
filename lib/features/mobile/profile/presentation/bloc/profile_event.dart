part of 'profile_bloc.dart';

class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetProfileDataEvent extends ProfileEvent {}

class UpdateProfileDataEvent extends ProfileEvent {
  final UserModel model;
  final Uint8List? byte;
  final String? fileName;
  UpdateProfileDataEvent({required this.model, this.byte, this.fileName});
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
