import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:karz/features/reservation/domain/entities/reservation_entity.dart';
import 'package:karz/features/reservation/domain/usecases/create_reservation.dart';
import 'package:karz/features/reservation/domain/usecases/delete_reservation.dart';
import 'package:karz/features/reservation/domain/usecases/get_reservation.dart';
import 'package:karz/features/reservation/domain/usecases/get_reservations_by_parking.dart';
import 'package:karz/features/reservation/domain/usecases/get_reservations_by_user.dart';
import 'package:karz/features/reservation/domain/usecases/update_reservation.dart';

part 'reservation_event.dart';
part 'reservation_state.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  ReservationBloc({
    required GetReservation getReservation,
    required GetReservationsByParking getReservationsByParking,
    required GetReservationsByUser getReservationsByUser,
    required CreateReservation createReservation,
    required UpdateReservation updateReservation,
    required CancelReservation cancelReservation
  }) : 
  
  _getReservation = getReservation,
  _getReservationsByParking = getReservationsByParking,
  _getReservationsByUser = getReservationsByUser,
  _createReservation = createReservation,
  _updateReservation = updateReservation,
  _cancelReservation = cancelReservation,
  super(ReservationInitial()) {
    on<GetCurrentReservationEvent>((event, emit) async {
      emit(ReservationLoading());

      final result = await _getReservation(event.id);

      result.fold(
        (failure) => null,
        (reservation) => emit(CurrentReservationLoaded(reservation: reservation))
      );

    });
    on<GetReservationsByUserEvent>((event, emit) async {
      emit(ReservationLoading());

      final result = await _getReservationsByUser(event.userId);

      result.fold(
        (failure) => null,
        (reservations) => emit(ReservationsLoaded(reservations: reservations))
      );
    });
    on<GetReservationsByParkingEvent>((event, emit) async {
      emit(ReservationLoading());

      final result = await _getReservationsByParking(event.parkingId);

      result.fold(
        (failure) => null,
        (reservations) => emit(ReservationsLoaded(reservations: reservations))
      );
    });
    on<CreateReservationEvent>((event, emit) async {
      final result = await _createReservation(event.reservation);

      result.fold((l) => null, (r) => emit(ReservationCreated()));
    });
    on<UpdateReservationEvent>((event, emit) async {
      final result = await _updateReservation(event.reservation);

      result.fold((l) => null, (r) => emit(ReservationUpdated()));
    });
    on<CancelReservationEvent>((event, emit) async {
      final result = await _cancelReservation(event.id);

      result.fold((_) => null, (_) => emit(ReservationCanceled()));
    });

  }

  final GetReservation _getReservation;
  final GetReservationsByParking _getReservationsByParking;
  final GetReservationsByUser _getReservationsByUser;
  final CreateReservation _createReservation;
  final UpdateReservation _updateReservation;
  final CancelReservation _cancelReservation;

}
