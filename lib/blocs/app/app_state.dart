part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  const AppState();
  // coverage:ignore-start
  @override
  List<Object?> get props => [];
// coverage:ignore-end
}

class LoadingAppState extends AppState {
  const LoadingAppState() : super();

  @override
  List<Object?> get props => [];
}

class CheckAvailabilityState extends AppState {
  const CheckAvailabilityState() : super();

  @override
  List<Object?> get props => [];
}

class StartReadingState extends AppState {
  const StartReadingState() : super();

  @override
  List<Object?> get props => [];
}

class StopReadingState extends AppState {
  const StopReadingState() : super();

  @override
  List<Object?> get props => [];
}
