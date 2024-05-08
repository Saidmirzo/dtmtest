import 'package:bloc/bloc.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/features/admin_panel/web_tarifs/domain/models/plan_model.dart';
import 'package:dtmtest/features/admin_panel/web_users/domain/repositories/web_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'plans_event.dart';
part 'plans_state.dart';
part 'plans_bloc.freezed.dart';

class PlansBloc extends Bloc<PlansEvent, PlansState> {
  final WebRepository webRepository;

  PlansBloc({required this.webRepository}) : super(const PlansState()) {
    on<PlansEvent>((event, emit) {});
    on<GetAllPlansEvent>(_getAllCategoryEvent);
  }

  _getAllCategoryEvent(event, emit) async {
    emit(state.copyWith(getAllPlanStatus: BlocStatus.inProgress));
    final result = await webRepository.getPlan();
    result.fold(
        (l) => emit(
              state.copyWith(
                getAllPlanStatus: BlocStatus.failed,
                message: l.message,
              ),
            ), (r) {      
      emit(
        state.copyWith(
          getAllPlanStatus: BlocStatus.completed,
          listCategories: r,
        ),
      );
    });
  }
}
