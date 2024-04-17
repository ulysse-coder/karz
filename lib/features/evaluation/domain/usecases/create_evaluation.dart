
import 'package:ulysse_app/core/typedef/typedef.dart';
import 'package:ulysse_app/core/usecases/usecases.dart';
import 'package:ulysse_app/features/evaluation/domain/entities/evaluation_entity.dart';
import 'package:ulysse_app/features/evaluation/domain/repositories/evaluation_repository.dart';

class CreateEvaluation extends UseCaseWithParameters<void, EvaluationEntity> {
  CreateEvaluation(this._repository);

  final EvaluationRepositoy _repository;

  @override
  ResultFuture<void> call(EvaluationEntity args) => _repository.createEvaluation(args); 
}