import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/category_model.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/theme_model.dart';
import 'package:dtmtest/features/admin_panel/web_users/domain/repositories/web_users_repository.dart';
import 'package:dtmtest/features/mobile/auth/data/model/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'web_bloc.freezed.dart';
part 'web_event.dart';
part 'web_state.dart';

class WebBloc extends Bloc<WebEvent, WebState> {
  final WebRepository webRepository;
  WebBloc({
    required this.webRepository,
  }) : super(const WebState()) {
    on<WebEvent>((event, emit) {});
    on<GetAllUsersEvent>(_getALlUserEvent);
    on<GetAllThemes>(_getAllThemesEvent);
    on<AddNewThemeEvent>(_addNewThemeEvent);

  }


  _getALlUserEvent(event, emit) async {
    emit(state.copyWith(getAllUsersStatus: BlocStatus.inProgress));
    final result = await webRepository.getAllUsers();
    result.fold(
      (l) => emit(
        state.copyWith(
          getAllUsersStatus: BlocStatus.failed,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          getAllUsersStatus: BlocStatus.completed,
          listUsers: r,
        ),
      ),
    );
  }

  _getAllThemesEvent(event, emit) async {
    emit(state.copyWith(getAllThemesStatus: BlocStatus.inProgress));
    final result = await webRepository.getAllThemes();
    result.fold(
      (l) => emit(
        state.copyWith(
          getAllThemesStatus: BlocStatus.failed,
        ),
      ),
      (r) => emit(
        state.copyWith(
          getAllThemesStatus: BlocStatus.completed,
          listThemes: r,
        ),
      ),
    );
  }

  _addNewThemeEvent(AddNewThemeEvent event, emit) async {
    emit(state.copyWith(addNewThemeStatus: BlocStatus.inProgress));
    final result = await webRepository.addNewTheme(
        event.filePath, event.name, event.categoryId);

    result.fold(
      (l) => emit(
        state.copyWith(
          addNewThemeStatus: BlocStatus.failed,
          message: l.message,
        ),
      ),
      (r) {
        emit(
          state.copyWith(
            addNewThemeStatus: BlocStatus.completed,
          ),
        );
        add(GetAllThemes());
      },
    );
  }

}
