import 'package:bloc/bloc.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/features/admin_panel/web_users/domain/repositories/web_repository.dart';
import 'package:dtmtest/features/mobile/auth/data/model/user_model.dart';
import 'package:dtmtest/features/mobile/auth/domain/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  WebRepository repository;
  AuthRepository authRepository;
  HomeBloc({required this.repository, required this.authRepository})
      : super(const HomeState()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<GetAllStatisticsEvent>(_getAllStatisticsEvent);
    on<GetUserModelEvent>(_getUserModel);
  }

  _getAllStatisticsEvent(event, emit) async {
    emit(state.copyWith(getAllStatisticsStatus: BlocStatus.inProgress));
    final result = await repository.getAllUsers();
    result.fold(
      (l) => emit(
        state.copyWith(
          getAllStatisticsStatus: BlocStatus.failed,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          getAllStatisticsStatus: BlocStatus.completed,
          listStatistics: r,
        ),
      ),
    );
  }

  _getUserModel(event, emit) async {
    emit(state.copyWith(getAllStatisticsStatus: BlocStatus.inProgress));
    final result = await authRepository.getLocaleUserModel();
    result.fold(
      (l) => emit(
        state.copyWith(
          getAllStatisticsStatus: BlocStatus.failed,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          getAllStatisticsStatus: BlocStatus.completed,
          userModel: r,
        ),
      ),
    );
  }
}
