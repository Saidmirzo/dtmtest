import 'package:bloc/bloc.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/features/admin_panel/web_users/data/models/admin_model.dart';
import 'package:dtmtest/features/admin_panel/web_users/domain/repositories/web_users_repository.dart';
import 'package:dtmtest/features/mobile/auth/data/model/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'web_users_bloc.freezed.dart';
part 'web_users_event.dart';
part 'web_users_state.dart';

class WebUsersBloc extends Bloc<WebUsersEvent, WebUsersState> {
  final WebUsersRepository webUsersRepository;
  WebUsersBloc({required this.webUsersRepository})
      : super(const WebUsersState()) {
    on<GetAdminsEvent>(_getAdminsEvent);
    on<GetUsersEvent>(_getUsersEvent);
    on<AddAdminEvent>(_addAdminEvent);
    on<EditAdminEvent>(_editAdminEvent);
    on<DeleteAdminEvent>(_deleteAdminEvent);
    on<DeleteUserEvent>(_deleteUserEvent);
    on<SearchChangedEvent>(_searchUsersEvent);
  }

  _getAdminsEvent(event, emit) async {
    emit(state.copyWith(getAllAdminsStatus: BlocStatus.inProgress));
    final result = await webUsersRepository.getAdmins();
    result.fold(
      (l) => emit(
        state.copyWith(
          getAllAdminsStatus: BlocStatus.failed,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          getAllAdminsStatus: BlocStatus.completed,
          listAdmins: r,
        ),
      ),
    );
  }

  _getUsersEvent(event, emit) async {
    emit(state.copyWith(getAllUsersStatus: BlocStatus.inProgress));
    final result = await webUsersRepository.getAllUsers();
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
            searchedUserList: r),
      ),
    );
  }

  _addAdminEvent(AddAdminEvent event, emit) async {
    emit(state.copyWith(addAdminStatus: BlocStatus.inProgress));
    final result = await webUsersRepository.addAdmin(event.model);
    result.fold(
      (l) => emit(
        state.copyWith(
          addAdminStatus: BlocStatus.failed,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          addAdminStatus: BlocStatus.completed,
        ),
      ),
    );
  }

  _editAdminEvent(EditAdminEvent event, emit) async {
    emit(state.copyWith(editAdminStatus: BlocStatus.inProgress));
    final result = await webUsersRepository.editAdmin(event.model);
    result.fold(
      (l) => emit(
        state.copyWith(
          editAdminStatus: BlocStatus.failed,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          editAdminStatus: BlocStatus.completed,
        ),
      ),
    );
  }

  _deleteAdminEvent(DeleteAdminEvent event, emit) async {
    emit(state.copyWith(deleteAdminStatus: BlocStatus.inProgress));
    final result = await webUsersRepository.deteleAdmin(event.id);
    result.fold(
      (l) => emit(
        state.copyWith(
          deleteAdminStatus: BlocStatus.failed,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          deleteAdminStatus: BlocStatus.completed,
        ),
      ),
    );
  }

  _deleteUserEvent(DeleteUserEvent event, emit) async {
    emit(state.copyWith(deleteUserStatus: BlocStatus.inProgress));
    final result = await webUsersRepository.deteleUser(event.id);
    result.fold(
      (l) => emit(
        state.copyWith(
          deleteUserStatus: BlocStatus.failed,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          deleteUserStatus: BlocStatus.completed,
        ),
      ),
    );
  }

  _searchUsersEvent(SearchChangedEvent event, emit) {
    final results = state.listUsers
        ?.where((user) =>
            user.fullName!.toLowerCase().contains(event.query.toLowerCase()))
        .toList();
    emit(state.copyWith(searchedUserList: results));
  }
}
