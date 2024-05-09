part of 'web_advertising_bloc.dart';

sealed class WebAdvertisingEvent extends Equatable {
  const WebAdvertisingEvent();

  @override
  List<Object> get props => [];
}

class GetAllAdvertisingEvent extends WebAdvertisingEvent {}

class AddNewAdvertising extends WebAdvertisingEvent {
  final AdvertisingModel advertisingModel;
  const AddNewAdvertising({required this.advertisingModel});
}

class UploadImageEvent extends WebAdvertisingEvent {
  final Uint8List byte;
  final String name;
  const UploadImageEvent({required this.byte, required this.name});
}

class EditAdvertisingEvent extends WebAdvertisingEvent {
  final AdvertisingModel advertisingModel;
  const EditAdvertisingEvent({required this.advertisingModel});
}

class DeleteAdvertisingEvent extends WebAdvertisingEvent {
  final String id;
  const DeleteAdvertisingEvent({required this.id});
}
