import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/features/admin_panel/web_advertising/domain/advertising_repository.dart';
import 'package:dtmtest/features/admin_panel/web_users/domain/repositories/web_repository.dart';
import 'package:dtmtest/features/mobile/auth/data/model/user_model.dart';
import 'package:dtmtest/features/mobile/profile/domain/repository/profile_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository authRepository;
  final WebRepository webRepository;
  final AdvertisingRepository advertisingRepository;
  ProfileBloc({
    required this.webRepository,
    required this.authRepository,
    required this.advertisingRepository,
  }) : super(const ProfileState()) {
    on<GetProfileDataEvent>(_getProfileData);
    on<UpdateProfileDataEvent>(_updateProfileData);
    // on<ProfileUpdateImageEvent>(_updateImageEvent);
    on<ProfileUploadImageEvent>(_uploadImageEvent);
  }
  _getProfileData(event, emit) async {
    emit(state.copyWith(getProfileDataStatus: BlocStatus.inProgress));
    final result = await authRepository.getProfileData();
    result.fold(
      (l) => emit(
        state.copyWith(
          getProfileDataStatus: BlocStatus.failed,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          getProfileDataStatus: BlocStatus.completed,
          profileData: r,
        ),
      ),
    );
  }

  _updateProfileData(UpdateProfileDataEvent event, emit) async {
    emit(state.copyWith(updateProfileDataStatus: BlocStatus.inProgress));
    final result = await authRepository.updateProfileData(event.model);
    result.fold(
      (l) => emit(
        state.copyWith(
          updateProfileDataStatus: BlocStatus.failed,
          message: l.message,
        ),
      ),
      (r) {
        emit(
          state.copyWith(
            updateProfileDataStatus: BlocStatus.completed,
          ),
        );
      },
    );
  }

  // _updateImageEvent(ProfileUpdateImageEvent event, emit) async {
  //   emit(state.copyWith(updateImageStatus: BlocStatus.inProgress));
  //   final result = await advertisingRepository.updateImage(
  //       event.byte, event.name, event.publicId);
  //   result.fold(
  //     (l) => emit(
  //       state.copyWith(
  //         updateImageStatus: BlocStatus.failed,
  //         message: l.message,
  //       ),
  //     ),
  //     (r) => emit(
  //       state.copyWith(
  //         updateImageStatus: BlocStatus.completed,
  //         imageLink: r,
  //       ),
  //     ),
  //   );
  // }

  _uploadImageEvent(ProfileUploadImageEvent event, emit) async {
    emit(state.copyWith(uploadImageStatus: BlocStatus.inProgress));
    final result =
        await advertisingRepository.uploadImage(event.byte, event.name);
    result.fold(
      (l) => emit(
        state.copyWith(
          uploadImageStatus: BlocStatus.failed,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          uploadImageStatus: BlocStatus.completed,
          imageLink: r,
        ),
      ),
    );
  }
}
