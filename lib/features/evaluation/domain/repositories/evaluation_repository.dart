
import 'package:ulysse_app/core/typedef/typedef.dart';
import 'package:ulysse_app/features/evaluation/domain/entities/evaluation_entity.dart';

abstract class EvaluationRepositoy {

  ResultVoid createEvaluation(EvaluationEntity evaluation);

}