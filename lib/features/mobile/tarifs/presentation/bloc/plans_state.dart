part of 'plans_bloc.dart';

@freezed
class PlansState with _$PlansState {
  const factory PlansState({
    @Default(BlocStatus.notInitialized) final BlocStatus getAllPlanStatus,
    final String? message,
    final List<PlanModel>? listCategories,
  }) = _PlansState;

  const PlansState._();
}
