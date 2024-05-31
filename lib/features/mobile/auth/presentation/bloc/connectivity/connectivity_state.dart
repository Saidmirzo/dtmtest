part of 'connectivity_cubit.dart';

@freezed
class ConnectivityState with _$ConnectivityState {
  const factory ConnectivityState.data(bool isConnected) = _Data;
}
