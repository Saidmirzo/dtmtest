import 'package:bloc/bloc.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/features/admin_panel/web_advertising/model/advertising_model.dart';
import 'package:dtmtest/features/admin_panel/web_users/domain/repositories/web_repository.dart';
import 'package:dtmtest/features/mobile/auth/data/model/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  WebRepository repository;
  HomeBloc({required this.repository}) : super(const HomeState()) {
    on<GetAllStatisticsEvent>(_getAllStatisticsEvent);
    on<GetAllCarouselImageEvent>(_getAllCaruselImagesEvent);
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
            ), (r) {
      List<UserModel>? listSort = r;
      listSort.sort((a, b) => (b.rating ?? 0).compareTo(a.rating ?? 0));
      emit(
        state.copyWith(
          getAllStatisticsStatus: BlocStatus.completed,
          listStatistics: r,
          listSortUsers: listSort,
        ),
      );
    });
  }

  _getAllCaruselImagesEvent(event, emit) async {
    emit(state.copyWith(getAllCarouselImageStatus: BlocStatus.inProgress));
    final result = await repository.getAllAdvertising();
    result.fold(
      (l) => emit(
        state.copyWith(
          getAllCarouselImageStatus: BlocStatus.failed,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          getAllCarouselImageStatus: BlocStatus.completed,
          listAdvertisiong: r,
        ),
      ),
    );
  }
}
