import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'connectivity_cubit.freezed.dart';
part 'connectivity_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  StreamSubscription<ConnectivityResult?>? subscription;

  ConnectivityCubit() : super(const ConnectivityState.data(true));

  void checkConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    _updateConnectivityStatus(connectivityResult);
  }

  _updateConnectivityStatus(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      emit(state.copyWith(isConnected: false));
    } else {
      emit(state.copyWith(isConnected: true));
    }
  }

  void trackConnectivity() {
    subscription = Connectivity().onConnectivityChanged.listen((result) {
      
      _updateConnectivityStatus(result);
    });
  }

  void back() {
    emit(state.copyWith(isConnected: true));
  }
}
