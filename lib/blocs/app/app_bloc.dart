import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppStateEvent, AppState> {

  static const methodChannel = MethodChannel('com.saina.integration/method');
  static const colorChannel = EventChannel('com.saina.integration/color');
  late StreamSubscription colorSubscription;

  AppBloc() : super(const LoadingAppState()) {
    on<CheckAvailabilityEvent>(_onCheckAvailability);
    on<StartReadingEvent>(_onStartReading);
    on<StopReadingEvent>(_onStopReading);
  }
  

  FutureOr<void> _onCheckAvailability(
    CheckAvailabilityEvent event,
    Emitter<AppState> emit,
  ) async {
     try {
      var available = await methodChannel.invokeMethod('isWebsocketAvailable');
    } on PlatformException catch (e) {
      log(e.message??'Error');
    }
    emit(const CheckAvailabilityState());
  }

  FutureOr<void> _onStartReading(
    StartReadingEvent event,
    Emitter<AppState> emit,
  ) async {
        colorSubscription =
        colorChannel.receiveBroadcastStream().listen((event) {});
        emit(const StartReadingState());
  }

  FutureOr<void> _onStopReading(
    StopReadingEvent event,
    Emitter<AppState> emit,
  ) async {
    colorSubscription.cancel();
    emit(const StopReadingState());
  }
}
