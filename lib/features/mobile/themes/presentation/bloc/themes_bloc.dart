import 'package:bloc/bloc.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/features/admin_panel/web_quizes/data/model/theme_model.dart';
import 'package:dtmtest/features/mobile/themes/domain/repository/themes_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'themes_event.dart';
part 'themes_state.dart';
part 'themes_bloc.freezed.dart';

class ThemesBloc extends Bloc<ThemesEvent, ThemesState> {
  final ThemesRepository themesRepository;
  ThemesBloc({required this.themesRepository}) : super(const ThemesState()) {
    on<ThemesEvent>((event, emit) {});
    on<GetThemesEvent>(_getAllThemesEvent);
  }

  _getAllThemesEvent(GetThemesEvent event, emit) async {
    emit(state.copyWith(getAllThemesStatus: BlocStatus.inProgress));
    final result = await themesRepository.getThemes(event.id);
    result.fold(
      (l) => emit(
        state.copyWith(
          getAllThemesStatus: BlocStatus.failed,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(getAllThemesStatus: BlocStatus.completed, listThemes: r),
      ),
    );
  }
}
