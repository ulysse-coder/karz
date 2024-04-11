
import 'package:ulysse_app/features/evaluation/data/models/evaluation_model.dart';

abstract class EvaluationRemoteDataSource {
  Future<void> createEvaluation(EvaluationModel evaluation);
}