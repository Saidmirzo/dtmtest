import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/features/admin_panel/web_advertising/model/advertising_model.dart';
import 'package:dtmtest/features/admin_panel/web_categories/models/category_model.dart';
import 'package:dtmtest/features/admin_panel/web_quizes/data/model/theme_model.dart';
import 'package:dtmtest/features/admin_panel/web_tarifs/domain/models/plan_model.dart';
import 'package:dtmtest/features/admin_panel/web_users/domain/repositories/web_repository.dart';
import 'package:dtmtest/features/mobile/auth/data/model/user_model.dart';
import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'web_bloc.freezed.dart';
part 'web_event.dart';
part 'web_state.dart';

class WebBloc extends Bloc<WebEvent, WebState> {
  final WebRepository webRepository;
  WebBloc({
    required this.webRepository,
  }) : super(const WebState()) {
    on<WebEvent>((event, emit) {});
    on<GetAllUsersEvent>(_getALlUserEvent);
    on<GetAllThemes>(_getAllThemesEvent);
    on<AddNewThemeEvent>(_addNewThemeEvent);
    on<AddNewAdvertising>(_addNewAdvertisingEvent);
    on<GetAllAdvertisingEvent>(_getALlAdvertisingEvent);

    on<UploadImageEvent>(_uploadIMageEvent);
    // on<UpdateImageEvent>(_updateImageEvent);
  }

  _uploadIMageEvent(UploadImageEvent event, emit) async {
    emit(state.copyWith(uploadImageStatus: BlocStatus.inProgress));
    final result = await webRepository.uploadImage(event.byte, event.name);
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

  // _updateImageEvent(UpdateImageEvent event, emit) async {
  //   emit(state.copyWith(updateImageStatus: BlocStatus.inProgress));
  //   final result =
  //       await webRepository.updateImage(event.byte, event.name, event.publicId);
  //   result.fold(
  //     (l) => emit(
  //       state.copyWith(
  //         updateImageStatus: BlocStatus.failed,
  //         message: l.message,
  //       ),
  //     ),
  //     (r) => emit(
  //       state.copyWith(
  //         updateImageStatus: BlocStatus.completed,
  //         imageLink: r,
  //       ),
  //     ),
  //   );
  // }

  _getALlUserEvent(event, emit) async {
    emit(state.copyWith(getAllUsersStatus: BlocStatus.inProgress));
    final result = await webRepository.getAllUsers();
    result.fold(
      (l) => emit(
        state.copyWith(
          getAllUsersStatus: BlocStatus.failed,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          getAllUsersStatus: BlocStatus.completed,
          listUsers: r,
        ),
      ),
    );
  }

  _getAllThemesEvent(event, emit) async {
    emit(state.copyWith(getAllThemesStatus: BlocStatus.inProgress));
    final result = await webRepository.getAllThemes();
    result.fold(
      (l) => emit(
        state.copyWith(
          getAllThemesStatus: BlocStatus.failed,
        ),
      ),
      (r) => emit(
        state.copyWith(
          getAllThemesStatus: BlocStatus.completed,
          listThemes: r,
        ),
      ),
    );
  }

  _addNewThemeEvent(AddNewThemeEvent event, emit) async {
    emit(state.copyWith(addNewThemeStatus: BlocStatus.inProgress));
    final result = await webRepository.addNewTheme(
        event.filePath, event.name, event.categoryId);

    result.fold(
      (l) => emit(
        state.copyWith(
          addNewThemeStatus: BlocStatus.failed,
          message: l.message,
        ),
      ),
      (r) {
        emit(
          state.copyWith(
            addNewThemeStatus: BlocStatus.completed,
          ),
        );
        add(GetAllThemes());
      },
    );
  }

  _addNewAdvertisingEvent(AddNewAdvertising event, emit) async {
    emit(state.copyWith(addNewadvertisingStatus: BlocStatus.inProgress));
    final result =
        await webRepository.addNewAdvertising(event.advertisingModel);

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
    final result = await webRepository.getAllAdvertising();
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
