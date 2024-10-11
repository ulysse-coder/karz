
import 'package:karz/features/evaluation/data/models/evaluation_model.dart';

abstract class EvaluationRemoteDataSource {
  Future<void> createEvaluation(EvaluationModel evaluation);
}