
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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

      final reservations = query.docs.where((doc) => doc['parking_id'] == parkingId);

      if(reservations.isEmpty) {
        return <ReservationModel>[];
      }

      return reservations.map((doc) => ReservationModel.fromDocumentSnapshot(doc)).toList();

    } catch (e) {
      throw(DBException(message: e.toString()));
    }
  }

  @override
  Future<List<ReservationModel>> getReservationsByUser(String userId) async {
    try {
      debugPrint("======= User id: $userId");
      final query = await _firestore.collection(_kReservationCollection).get();

      if (query.docs.isEmpty) {
        debugPrint("======= Collection vide ======");
        return <ReservationModel>[];
      }

      debugPrint("======= Collection pas vide ======");
      final reservations = query.docs.where((doc) => doc['conductor_id'] == userId);
      debugPrint("${ReservationModel.fromDocumentSnapshot(reservations.first)}");

      if(reservations.isEmpty) {
        return <ReservationModel>[];
      }

      return reservations.map((doc) => ReservationModel.fromDocumentSnapshot(doc)).toList();
    } catch (e) {
      debugPrint("===== error: $e");
      throw(DBException(message: e.toString()));
    }
  }

}