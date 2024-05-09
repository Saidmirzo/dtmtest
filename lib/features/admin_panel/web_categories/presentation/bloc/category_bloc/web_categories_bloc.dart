import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/category_model.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/theme_model.dart';
import 'package:dtmtest/features/admin_panel/web_categories/domain/repository/web_category_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'web_categories_bloc.freezed.dart';
part 'web_categories_event.dart';
part 'web_categories_state.dart';

class WebCategoriesBloc extends Bloc<WebCategoriesEvent, WebCategoriesState> {
  final WebCategoryRepository webCategoryRepository;
  WebCategoriesBloc({required this.webCategoryRepository})
      : super(const WebCategoriesState()) {
    on<GetAllCategoriesEvent>(_getAllCategoryEvent);
    on<AddCategoryEvent>(_addCategoryEvent);
    on<DeleteCategoryEvent>(_deleteCategoryEvent);
    on<EditCategoryEvent>(_editCategoryEvent);
    on<GetAllThemesEvent>(_getAllThemesEvent);
    on<AddNewThemeEvent>(_addNewThemeEvent);
  }

  _addCategoryEvent(AddCategoryEvent event, emit) async {
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

        add(GetAllCategoriesEvent());
      },
    );
  }

  _editCategoryEvent(EditCategoryEvent event, emit) async {
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

  _deleteCategoryEvent(DeleteCategoryEvent event, emit) async {
    emit(state.copyWith(deleteCategoryStatus: BlocStatus.inProgress));
    final result = await webCategoryRepository.deleteCategory(event.model);
    result.fold(
      (l) => emit(
        state.copyWith(
          deleteCategoryStatus: BlocStatus.failed,
          message: l.message,
        ),
      ),
      (r) {
        List<CategoryModel> categList = [];
        categList.addAll(state.listCategories ?? []);
        int index = categList.indexWhere((element) =>
            element.name?.toLowerCase() == event.model?.name?.toLowerCase());
        categList.removeAt(index);
        emit(
          state.copyWith(
              deleteCategoryStatus: BlocStatus.completed,
              listCategories: categList),
        );
      },
    );
  }

  _getAllCategoryEvent(event, emit) async {
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

  
  _getAllThemesEvent(event, emit) async {
    emit(state.copyWith(getAllThemesStatus: BlocStatus.inProgress));
    final result = await webCategoryRepository.getAllThemes();
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
    final result = await webCategoryRepository.addNewTheme(
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
        add(GetAllThemesEvent());
      },
    );
  }
}
