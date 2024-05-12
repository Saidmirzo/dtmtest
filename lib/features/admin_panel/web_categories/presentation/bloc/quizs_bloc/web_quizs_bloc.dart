import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/category_model.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/theme_model.dart';
import 'package:dtmtest/features/admin_panel/web_categories/domain/repository/web_category_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'web_quizs_event.dart';
part 'web_quizs_state.dart';
part 'web_quizs_bloc.freezed.dart';

class WebQuizsBloc extends Bloc<WebQuizsEvent, WebQuizsState> {
  final WebCategoryRepository webCategoryRepository;
  String? categoryId = '';
  WebQuizsBloc({required this.webCategoryRepository})
      : super(const WebQuizsState()) {
    on<AddQuizsEvent>(_addQuizsEvent);
    on<DeleteQuizsEvent>(_deleteQuizsEvent);
    on<EditQuizsEvent>(_editQuizsEvent);
    on<GetAllQuizsEvent>(_getAllQuizsEvent);
    on<GetAllQuizThemesEvent>(_getAllThemesEvent);
    on<AddNewQuizThemeEvent>(_addNewThemeEvent);
  }

  _addQuizsEvent(AddQuizsEvent event, emit) async {
    emit(state.copyWith(addCategoryStatus: BlocStatus.inProgress));
    final result = await webCategoryRepository.addCategory(event.model);
    result.fold(
      (l) => emit(
        state.copyWith(
          addCategoryStatus: BlocStatus.failed,
          message: l.message,
        ),
      ),
      (r) {
        emit(
          state.copyWith(
            addCategoryStatus: BlocStatus.completed,
          ),
        );

        add(GetAllQuizsEvent());
      },
    );
  }

  _editQuizsEvent(EditQuizsEvent event, emit) async {
    emit(state.copyWith(editategoryStatus: BlocStatus.inProgress));
    final result = await webCategoryRepository.editCategory(event.model);
    result.fold(
      (l) => emit(
        state.copyWith(
          editategoryStatus: BlocStatus.failed,
          message: l.message,
        ),
      ),
      (r) {
        List<CategoryModel> categList = [];
        categList.addAll(state.listCategories ?? []);
        int index =
            categList.indexWhere((element) => element.id == event.model?.id);
        categList.removeAt(index);
        categList.insert(index, event.model!);
        emit(
          state.copyWith(
              editategoryStatus: BlocStatus.completed,
              listCategories: categList),
        );
      },
    );
  }

  _deleteQuizsEvent(DeleteQuizsEvent event, emit) async {
    emit(state.copyWith(deleteCategoryStatus: BlocStatus.inProgress));
    final result = await webCategoryRepository.deleteCategory(event.id);
    result.fold(
      (l) => emit(
        state.copyWith(
          deleteCategoryStatus: BlocStatus.failed,
          message: l.message,
        ),
      ),
      (r) {
        emit(
          state.copyWith(deleteCategoryStatus: BlocStatus.completed),
        );
      },
    );
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
        add(GetAllQuizThemesEvent(id: event.categoryId));
      },
    );
  }
}
