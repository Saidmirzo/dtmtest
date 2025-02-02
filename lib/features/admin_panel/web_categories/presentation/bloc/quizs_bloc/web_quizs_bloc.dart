import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/category_model.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/theme_model.dart';
import 'package:dtmtest/features/admin_panel/web_categories/domain/repository/web_category_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'web_quizs_bloc.freezed.dart';
part 'web_quizs_event.dart';
part 'web_quizs_state.dart';

class WebQuizsBloc extends Bloc<WebQuizsEvent, WebQuizsState> {
  final WebCategoryRepository webCategoryRepository;
  String? categoryId = '';
  WebQuizsBloc({required this.webCategoryRepository})
      : super(const WebQuizsState()) {
    on<GetAllQuizCategoryEvent>(_getAllQuizsEvent);
    on<GetAllQuizThemesEvent>(_getAllThemesEvent);
    on<AddNewQuizThemeEvent>(_addNewThemeEvent);
    on<EditQuizThemeEvent>(_editQuizThemeEvent);
    on<DeleteQuizThemeEvent>(_deleteQuizThemeEvent);
  }


  


  _getAllQuizsEvent(event, emit) async {
    emit(state.copyWith(getAllCategoriesStatus: BlocStatus.inProgress));
    final result = await webCategoryRepository.getAllCategories();
    result.fold(
      (l) => emit(
        state.copyWith(
          getAllCategoriesStatus: BlocStatus.failed,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          getAllCategoriesStatus: BlocStatus.completed,
          listCategories: r,
        ),
      ),
    );
  }

  _getAllThemesEvent(GetAllQuizThemesEvent event, emit) async {
    emit(state.copyWith(getAllThemesStatus: BlocStatus.inProgress));
    categoryId = event.id;
    final result = await webCategoryRepository.getAllThemes(event.id);
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

  _addNewThemeEvent(AddNewQuizThemeEvent event, emit) async {
    emit(state.copyWith(addNewThemeStatus: BlocStatus.inProgress));
    final result = await webCategoryRepository.addTheme(
      event.filePath,
      event.name,
      event.categoryId,
    );

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
        add(GetAllQuizThemesEvent(id: event.categoryId));
      },
    );
  }

  _editQuizThemeEvent(EditQuizThemeEvent event, emit) async {
    emit(state.copyWith(editThemeStatus: BlocStatus.inProgress));
    final result =
        await webCategoryRepository.editTheme(event.categoryId, event.model);
    result.fold(
      (l) => emit(
        state.copyWith(
          editThemeStatus: BlocStatus.failed,
          message: l.message,
        ),
      ),
      (r) {
        List<ThemeModel> themeList = [];
        themeList.addAll(state.listThemes ?? []);
        int index =
            themeList.indexWhere((element) => element.id == event.model.id);
        themeList.removeAt(index);
        themeList.insert(index, event.model);
        emit(
          state.copyWith(
              editThemeStatus: BlocStatus.completed, listThemes: themeList),
        );
      },
    );
  }

  _deleteQuizThemeEvent(DeleteQuizThemeEvent event, emit) async {
    emit(state.copyWith(deleteThemeStatus: BlocStatus.inProgress));
    final result = await webCategoryRepository.deleteTheme(
        event.idTheme, event.idCategory);
    result.fold(
      (l) => emit(
        state.copyWith(
          deleteThemeStatus: BlocStatus.failed,
          message: l.message,
        ),
      ),
      (r) {
        emit(
          state.copyWith(deleteThemeStatus: BlocStatus.completed),
        );
        add(GetAllQuizThemesEvent(id: event.idCategory));
      },
    );
  }
}
