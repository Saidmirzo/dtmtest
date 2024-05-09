import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/features/admin_panel/web_advertising/data/models/advertising_model.dart';
import 'package:dtmtest/features/admin_panel/web_advertising/domain/advertising_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'web_advertising_event.dart';
part 'web_advertising_state.dart';
part 'web_advertising_bloc.freezed.dart';

class WebAdvertisingBloc
    extends Bloc<WebAdvertisingEvent, WebAdvertisingState> {
  AdvertisingRepository advertisingRepository;
  WebAdvertisingBloc({required this.advertisingRepository})
      : super(const WebAdvertisingState()) {
    on<WebAdvertisingEvent>((event, emit) {});
    on<GetAllAdvertisingEvent>(_getALlAdvertisingEvent);
    on<AddNewAdvertising>(_addNewAdvertisingEvent);
    on<UploadImageEvent>(_uploadIMageEvent);
    on<EditAdvertisingEvent>(_editAdvertisingEvent);
    on<DeleteAdvertisingEvent>(_deleteAdvertisingEvent);
  }

  _deleteAdvertisingEvent(DeleteAdvertisingEvent event, emit) async {
    emit(state.copyWith(deleteAdvertisingStatus: BlocStatus.inProgress));
    final result = await advertisingRepository.deleteAdvertising(event.id);
    result.fold(
      (l) => emit(
        state.copyWith(
          deleteAdvertisingStatus: BlocStatus.failed,
          message: l.message,
        ),
      ),
      (r) {
        emit(
          state.copyWith(
            deleteAdvertisingStatus: BlocStatus.completed,
          ),
        );
        add(GetAllAdvertisingEvent());
      },
    );
  }

  _editAdvertisingEvent(EditAdvertisingEvent event, emit) async {
    emit(state.copyWith(editAdvertisingStatus: BlocStatus.inProgress));
    final result =
        await advertisingRepository.editAdvertising(event.advertisingModel);
    result.fold(
      (l) => emit(
        state.copyWith(
          editAdvertisingStatus: BlocStatus.failed,
          message: l.message,
        ),
      ),
      (r) {
        emit(
          state.copyWith(
            editAdvertisingStatus: BlocStatus.completed,
          ),
        );
        add(GetAllAdvertisingEvent());
      },
    );
  }

  _uploadIMageEvent(UploadImageEvent event, emit) async {
    emit(state.copyWith(uploadImageStatus: BlocStatus.inProgress));
    final result =
        await advertisingRepository.uploadImage(event.byte, event.name);
    result.fold(
      (l) => emit(
        state.copyWith(
          uploadImageStatus: BlocStatus.failed,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          uploadImageStatus: BlocStatus.completed,
          imageLink: r,
        ),
      ),
    );
  }

  _addNewAdvertisingEvent(AddNewAdvertising event, emit) async {
    emit(state.copyWith(addNewadvertisingStatus: BlocStatus.inProgress));
    final result =
        await advertisingRepository.addNewAdvertising(event.advertisingModel);

    result.fold(
      (l) => emit(
        state.copyWith(
          addNewadvertisingStatus: BlocStatus.failed,
          message: l.message,
        ),
      ),
      (r) {
        emit(
          state.copyWith(
            addNewadvertisingStatus: BlocStatus.completed,
          ),
        );
        add(GetAllAdvertisingEvent());
      },
    );
  }

  _getALlAdvertisingEvent(GetAllAdvertisingEvent event, emit) async {
    emit(state.copyWith(getAllAdvertisingStatus: BlocStatus.inProgress));
    final result = await advertisingRepository.getAllAdvertising();
    result.fold(
      (l) => emit(
        state.copyWith(
          getAllAdvertisingStatus: BlocStatus.failed,
          message: l.message,
        ),
      ),
      (r) {
        emit(
          state.copyWith(
            getAllAdvertisingStatus: BlocStatus.completed,
            listAdvertising: r,
          ),
        );
      },
    );
  }
}
