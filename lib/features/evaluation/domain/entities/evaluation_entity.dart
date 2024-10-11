
import 'package:equatable/equatable.dart';
import 'package:karz/core/utilities/enum.dart';

class EvaluationEntity extends Equatable {
  const EvaluationEntity({
    required this.id,
    required this.rate,
    required this.comment,
    required this.impressions,
    required this.conductorId,
    required this.parkingId,
    required this.createdAt
  });

  final String id;
  final double rate;
  final String comment;
  final List<Impressions?> impressions;
  final String conductorId;
  final String parkingId;
  final DateTime createdAt;

  @override
  List<Object?> get props => [id, rate, comment, impressions, conductorId, parkingId, createdAt];
}