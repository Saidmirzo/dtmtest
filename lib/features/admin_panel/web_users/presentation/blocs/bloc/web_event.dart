part of 'web_bloc.dart';

sealed class WebEvent extends Equatable {
  const WebEvent();

  @override
  List<Object> get props => [];
}

class GetAllUsersEvent extends WebEvent {}

class GetAllThemes extends WebEvent {}

class AddNewThemeEvent extends WebEvent {
  final Uint8List filePath;
  final String name;
  final String categoryId;
  const AddNewThemeEvent({
    required this.filePath,
    required this.name,
    required this.categoryId,
  });
}

class AddNewAdvertising extends WebEvent {
  final AdvertisingModel advertisingModel;
  const AddNewAdvertising({required this.advertisingModel});
}

class GetAllAdvertisingEvent extends WebEvent {}

class GetPlansEvent extends WebEvent {}

class AddPlanEvent extends WebEvent {
  const AddPlanEvent({required this.model});
  final PlanModel model;
}

class DeletePlanEvent extends WebEvent {
  const DeletePlanEvent({required this.model});
  final PlanModel? model;
}

class EditPlanEvent extends WebEvent {
  const EditPlanEvent({required this.model});
  final PlanModel? model;
}

class UploadImageEvent extends WebEvent {
  final Uint8List byte;
  final String name;
  const UploadImageEvent({required this.byte, required this.name});
}

class UpdateImageEvent extends WebEvent {
  final Uint8List byte;
  final String name, publicId;
  const UpdateImageEvent({
    required this.byte,
    required this.name,
    required this.publicId,
  });
}
