import 'package:bloc/bloc.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/features/mobile/auth/data/model/user_model.dart';
import 'package:dtmtest/features/mobile/profile/domain/repository/profile_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository authRepository;
  ProfileBloc({required this.authRepository}) : super(const ProfileState()) {
    on<GetProfileDataEvent>(_getProfileData);
    on<UpdateProfileDataEvent>(_updateProfileData);
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
}
