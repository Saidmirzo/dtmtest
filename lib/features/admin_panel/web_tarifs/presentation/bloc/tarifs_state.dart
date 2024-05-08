part of 'tarifs_bloc.dart';

@freezed
class TarifsState with _$TarifsState {
  const factory TarifsState({
     @Default(BlocStatus.notInitialized) final BlocStatus getTarifsStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus getAllPlansStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus addPlanStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus deletePlanStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus editPlanStatus,

    final List<PlanModel>? listPlans,
    final String? message,
  }) = _TarifsState;
 const TarifsState._();
}
