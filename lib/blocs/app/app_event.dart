part of 'app_bloc.dart';

abstract class AppStateEvent extends Equatable {
  const AppStateEvent();

  @override
  List<Object?> get props => [];
}

class CheckAvailabilityEvent extends AppStateEvent {
  const CheckAvailabilityEvent();
}

class StartReadingEvent extends AppStateEvent {
  const StartReadingEvent();
}

class StopReadingEvent extends AppStateEvent {
  const StopReadingEvent();
}