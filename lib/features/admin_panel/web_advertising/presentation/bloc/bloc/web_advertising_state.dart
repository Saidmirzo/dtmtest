part of 'web_advertising_bloc.dart';


@freezed

 class WebAdvertisingState with _$WebAdvertisingState {
  const factory WebAdvertisingState({
    @Default(BlocStatus.notInitialized) final BlocStatus addNewadvertisingStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus getAllAdvertisingStatus,
    @Default(BlocStatus.notInitialized) final BlocStatus uploadImageStatus,

    final List<AdvertisingModel>? listAdvertising,
    final String? imageLink,

    final String? message,

  })=_WebAdvertisingState;

  const WebAdvertisingState._();
}

