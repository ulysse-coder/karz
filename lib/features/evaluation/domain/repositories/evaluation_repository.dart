
import 'package:karz/core/typedef/typedef.dart';
import 'package:karz/features/evaluation/domain/entities/evaluation_entity.dart';

abstract class EvaluationRepositoy {

  ResultVoid createEvaluation(EvaluationEntity evaluation);

}