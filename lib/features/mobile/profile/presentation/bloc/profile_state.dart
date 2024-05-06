part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
     @Default(BlocStatus.notInitialized) final BlocStatus getProfileDataStatus,
     @Default(BlocStatus.notInitialized) final BlocStatus updateProfileDataStatus,
     final UserModel? profileData,
     final String? message,

  }) = _ProfileState;

  const ProfileState._();
}
