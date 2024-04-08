
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ulysse_app/core/errors/db_exception.dart';
import 'package:ulysse_app/features/reservation/data/data_sources/remote/reservation_remote_data_source.dart';
import 'package:ulysse_app/features/reservation/data/models/reservation_model.dart';

class ReservationRemoteDataSourceImplementation implements ReservationRemoteDataSource {
  const ReservationRemoteDataSourceImplementation(this._firestore);

  final FirebaseFirestore _firestore;

  static const _kReservationCollection = 'reservation';

  @override
  Future<void> cancelReservation(String id) async {
    try {
      await _firestore.collection(_kReservationCollection).doc(id).update({'status': 'annule'});
    } catch (e) {
      throw(DBException(message: e.toString()));
    }
  }

  @override
  Future<void> createReservation(ReservationModel reservation) async {
    try {
      await _firestore.collection(_kReservationCollection).add(reservation.toJson());
    } catch (e) {
      throw(DBException(message: e.toString()));
    }
  }

  @override
  Future<void> updateReservation(ReservationModel reservation) async {
    try {
      await _firestore.collection(_kReservationCollection)
        .doc(reservation.id)
        .update(reservation.toJson());

    } catch (e) {
      throw(DBException(message: e.toString()));
    }
  }

  @override
  Future<ReservationModel> getReservation(String id) async {
    try {
      final doc = await _firestore.collection(_kReservationCollection)
        .doc(id)
        .get();

      return ReservationModel.fromDocumentSnapshot(doc);

    } catch (e) {
      throw(DBException(message: e.toString()));
    }
  }

  @override
  Future<List<ReservationModel>> getReservationByParking(String parkingId) async {
    try {
      final query = await _firestore.collection(_kReservationCollection).get();

      if (query.docs.isEmpty) {
        return <ReservationModel>[];
      }

      final reservationsByParking = query.docs
        .map((doc) => ReservationModel.fromDocumentSnapshot(doc))
        .where((reservation) => reservation.parkingId == parkingId)
        .toList();

      if (reservationsByParking.isEmpty) {
        return <ReservationModel>[];
      }

      return reservationsByParking;

    } catch (e) {
      throw(DBException(message: e.toString()));
    }
  }

  @override
  Future<List<ReservationModel>> getReservationsByUser(String userId) async {
    try {
      final query = await _firestore.collection(_kReservationCollection).get();

      if (query.docs.isEmpty) {
        return <ReservationModel>[];
      }

      final reservationsByUser = query.docs
        .map((doc) => ReservationModel.fromDocumentSnapshot(doc))
        .where((reservation) => reservation.conductorId == userId)
        .toList();

      if (reservationsByUser.isEmpty) {
        return <ReservationModel>[];
      }

      return reservationsByUser;
    } catch (e) {
      throw(DBException(message: e.toString()));
    }
  }

}