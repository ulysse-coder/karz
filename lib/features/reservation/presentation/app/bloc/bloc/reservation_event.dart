part of 'reservation_bloc.dart';

sealed class ReservationEvent extends Equatable {
  const ReservationEvent();

  @override
  List<Object> get props => [];
}

class GetCurrentReservationEvent extends ReservationEvent {
  const GetCurrentReservationEvent({ required this.id });

  final String id;

  @override
  List<Object> get props => [id];
}

class GetReservationsByUserEvent extends ReservationEvent {
  const GetReservationsByUserEvent({ required this.userId });

  final String userId;

  @override
  List<Object> get props => [userId];
}

class GetReservationsByParkingEvent extends ReservationEvent {
  const GetReservationsByParkingEvent({ required this.parkingId });

  final String parkingId;

  @override
  List<Object> get props => [parkingId];
}

class CreateReservationEvent extends ReservationEvent {
  const CreateReservationEvent({ required this.reservation });

  final ReservationEntity reservation;

  @override
  List<Object> get props => [reservation];
}

class UpdateReservationEvent extends ReservationEvent {
  const UpdateReservationEvent({ required this.reservation });

  final ReservationEntity reservation;

  @override
  List<Object> get props => [reservation];
}

class CancelReservationEvent extends ReservationEvent {
  const CancelReservationEvent({ required this.id });

  final String id;

  @override
  List<Object> get props => [id];
}