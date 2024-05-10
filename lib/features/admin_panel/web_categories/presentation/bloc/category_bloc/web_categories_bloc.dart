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
    on<AddThemeEvent>(_addThemeEvent);
    on<EditThemeEvent>(_editThemeEvent);
    on<DeleteThemeEvent>(_deleteThemeEvent);
  }

  _addCategoryEvent(AddCategoryEvent event, emit) async {
    // emit(state.copyWith(addCategoryStatus: BlocStatus.inProgress));
    // final result = await webCategoryRepository.addCategory(event.model);
    // result.fold(
    //   (l) => emit(
    //     state.copyWith(
    //       addCategoryStatus: BlocStatus.failed,
    //       message: l.message,
    //     ),
    //   ),
    //   (r) {
    //     emit(
    //       state.copyWith(
    //         addCategoryStatus: BlocStatus.completed,
    //       ),
    //     );

    //     add(GetAllCategoriesEvent());
    //   },
    // );
    emit(state.copyWith(addCategoryStatus: BlocStatus.inProgress));
    final result =
        await webCategoryRepository.uploadImage(event.byte, event.fileName);
    String? link;
    result.fold(
      (l) => emit(
        state.copyWith(
          addCategoryStatus: BlocStatus.failed,
          message: l.message,
        ),
      ),
      (r) async {
        link = r;
      },
    );
    if (link != null) {
      final CategoryModel advertisingModel = event.model;
      advertisingModel.image = link;
      final response =
          await webCategoryRepository.addCategory(advertisingModel);
      response.fold(
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
  }

  _editCategoryEvent(EditCategoryEvent event, emit) async {
    emit(state.copyWith(editCategoryStatus: BlocStatus.inProgress));
    final result = await webCategoryRepository.editCategory(event.model);
    result.fold(
      (l) => emit(
        state.copyWith(
          editCategoryStatus: BlocStatus.failed,
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
              editCategoryStatus: BlocStatus.completed,
              listCategories: categList),
        );
      },
    );
  }

  _deleteCategoryEvent(DeleteCategoryEvent event, emit) async {
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

  _getAllThemesEvent(GetAllThemesEvent event, emit) async {
    emit(state.copyWith(getThemesStatus: BlocStatus.inProgress));
    final result = await webCategoryRepository.getAllThemes(event.categoryId);
    result.fold(
      (l) => emit(
        state.copyWith(
          getThemesStatus: BlocStatus.failed,
        ),
      ),
      (r) => emit(
        state.copyWith(
          getThemesStatus: BlocStatus.completed,
          listThemes: r,
        ),
      ),
    );
  }

  _addThemeEvent(AddThemeEvent event, emit) async {
    emit(state.copyWith(addThemeStatus: BlocStatus.inProgress));
    final result = await webCategoryRepository.addTheme(
        event.filePath, event.name, event.categoryId);
    result.fold(
      (l) => emit(
        state.copyWith(
          addThemeStatus: BlocStatus.failed,
          message: l.message,
        ),
      ),
      (r) {
        emit(
          state.copyWith(
            addThemeStatus: BlocStatus.completed,
          ),
        );
        // add(GetAllThemesEvent());
      },
    );
  }

  _editThemeEvent(EditThemeEvent event, emit) async {
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
        emit(
          state.copyWith(
            editThemeStatus: BlocStatus.completed,
          ),
        );
        // add(GetAllThemesEvent());
      },
    );
  }

  _deleteThemeEvent(DeleteThemeEvent event, emit) async {
    emit(state.copyWith(deleteThemeStatus: BlocStatus.inProgress));
    final result = await webCategoryRepository.deleteTheme(
        event.themeId, event.categoryId);
    result.fold(
      (l) => emit(
        state.copyWith(
          deleteThemeStatus: BlocStatus.failed,
          message: l.message,
        ),
      ),
      (r) {
        emit(
          state.copyWith(
            deleteThemeStatus: BlocStatus.completed,
          ),
        );
        // add(GetAllThemesEvent());
      },
    );
  }
}
