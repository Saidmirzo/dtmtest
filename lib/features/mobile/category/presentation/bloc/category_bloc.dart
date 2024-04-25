import 'package:bloc/bloc.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/features/admin_panel/web_categories/models/category_model.dart';
import 'package:dtmtest/features/mobile/category/domain/repositories/category_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_event.dart';
part 'category_state.dart';
part 'category_bloc.freezed.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryBloc({required this.categoryRepository})
      : super(const CategoryState()) {
    on<CategoryEvent>((event, emit) {});
    on<GetAllCategoriesEvent>(_getAllCategoryEvent);
  }

  _getAllCategoryEvent(event, emit) async {
    emit(state.copyWith(getAllCategoriesStatus: BlocStatus.inProgress));
    final result = await categoryRepository.getAllCategory();
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
}
