part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(BlocStatus.notInitialized) final BlocStatus getProfileDataStatus,
    @Default(BlocStatus.notInitialized)
    final BlocStatus updateProfileDataStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus uploadImageStatus,
    final UserModel? profileData,
    final String? message,
    @Default(BlocStatus.notInitialized) final BlocStatus updateImageStatus,
    final String? imageLink,
  }) = _ProfileState;

  const ProfileState._();
}
