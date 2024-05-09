part of 'tarifs_bloc.dart';

class TarifsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetPlansEvent extends TarifsEvent {}

class AddPlanEvent extends TarifsEvent {
  AddPlanEvent({required this.model});
  final PlanModel model;
}

class DeletePlanEvent extends TarifsEvent {
  DeletePlanEvent({required this.model});
  final PlanModel? model;
}

class EditPlanEvent extends TarifsEvent {
  EditPlanEvent({required this.model});
  final PlanModel? model;
}
