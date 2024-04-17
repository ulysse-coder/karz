part of 'reservation_bloc.dart';

sealed class ReservationState extends Equatable {
  const ReservationState();
  
  @override
  List<Object> get props => [];
}

final class ReservationInitial extends ReservationState {}

final class ReservationLoading extends ReservationState {}

final class ReservationsLoaded extends ReservationState {
  const ReservationsLoaded({ required this.reservations});

  final List<ReservationEntity> reservations;

  @override
  List<Object> get props => [reservations];
}

final class CurrentReservationLoaded extends ReservationState {
  const CurrentReservationLoaded({ required this.reservation});

  final ReservationEntity reservation;

  @override
  List<Object> get props => [reservation];
}

final class ReservationCreated extends ReservationState {}

final class ReservationUpdated extends ReservationState {}

final class ReservationCanceled extends ReservationState {}

final class ReservationError extends ReservationState {
  final String message;

  const ReservationError(this.message);

  @override
  List<Object> get props => [message];
}
