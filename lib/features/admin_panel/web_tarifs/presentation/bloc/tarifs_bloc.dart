import 'package:bloc/bloc.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/features/admin_panel/web_tarifs/domain/models/plan_model.dart';
import 'package:dtmtest/features/admin_panel/web_tarifs/domain/repositories/tarifs_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tarifs_event.dart';
part 'tarifs_state.dart';
part 'tarifs_bloc.freezed.dart';

class TarifsBloc extends Bloc<TarifsEvent, TarifsState> {
    final TarifsRepository tarifRepository;
  TarifsBloc({required this.tarifRepository}) : super(const TarifsState()) {
       on<GetPlansEvent>(_getPlanEvent);
    on<AddPlanEvent>(_addPlanEvent);
    on<DeletePlanEvent>(_deletePlanEvent);
    on<EditPlanEvent>(_editPlanEvent);
  }

  _addPlanEvent(AddPlanEvent event, emit) async {
    emit(state.copyWith(addPlanStatus: BlocStatus.inProgress));
    final result = await tarifRepository.addPlan(event.model);
    result.fold(
        (l) => emit(
              state.copyWith(
                addPlanStatus: BlocStatus.failed,
                message: l.message,
              ),
            ), (r) {
      emit(
        state.copyWith(
          addPlanStatus: BlocStatus.completed,
        ),
      );
      add(GetPlansEvent());
    });
  }

  _editPlanEvent(EditPlanEvent event, emit) async {
    emit(state.copyWith(editPlanStatus: BlocStatus.inProgress));
    final result = await tarifRepository.editPlan(event.model);
    result.fold(
      (l) => emit(
        state.copyWith(
          editPlanStatus: BlocStatus.failed,
          message: l.message,
        ),
      ),
      (r) {
        List<PlanModel> plansList = [];
        plansList.addAll(state.listPlans ?? []);
        int index =
            plansList.indexWhere((element) => element.id == event.model?.id);
        plansList.removeAt(index);
        plansList.insert(index, event.model!);
        emit(
          state.copyWith(
              editPlanStatus: BlocStatus.completed, listPlans: plansList),
        );
      },
    );
  }

  _deletePlanEvent(DeletePlanEvent event, emit) async {
    emit(state.copyWith(deletePlanStatus: BlocStatus.inProgress));
    final result = await tarifRepository.deletePlan(event.model);
    result.fold(
      (l) => emit(
        state.copyWith(
          deletePlanStatus: BlocStatus.failed,
          message: l.message,
        ),
      ),
      (r) {
        List<PlanModel> planList = [];
        planList.addAll(state.listPlans ?? []);
        int index =
            planList.indexWhere((element) => element.id == event.model?.id);
        planList.removeAt(index);
        emit(
          state.copyWith(
              deletePlanStatus: BlocStatus.completed, listPlans: planList),
        );
      },
    );
  }

  _getPlanEvent(event, emit) async {
    emit(state.copyWith(getAllPlansStatus: BlocStatus.inProgress));
    final result = await tarifRepository.getPlan();
    result.fold(
      (l) => emit(
        state.copyWith(
          getAllPlansStatus: BlocStatus.failed,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          getAllPlansStatus: BlocStatus.completed,
          listPlans: r,
        ),
      ),
    );
  }
}
