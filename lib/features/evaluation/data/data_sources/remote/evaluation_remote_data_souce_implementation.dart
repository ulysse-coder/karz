
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ulysse_app/core/errors/db_exception.dart';
import 'package:ulysse_app/features/evaluation/data/data_sources/remote/evaluation_remote_data_source.dart';
import 'package:ulysse_app/features/evaluation/data/models/evaluation_model.dart';

class EvaluationRemoteDataSourceImplementation implements EvaluationRemoteDataSource {
  const EvaluationRemoteDataSourceImplementation(this._firestore);

  final FirebaseFirestore _firestore;

  static const _kEvaluationCollection = 'evaluations';

  @override
  Future<void> createEvaluation(EvaluationModel evaluation) async {
    try {
      await _firestore.collection(_kEvaluationCollection).add(evaluation.toJson());
    } catch (e) {
      throw DBException(message: e.toString());
    }
  }
}