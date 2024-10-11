
import 'package:karz/core/typedef/typedef.dart';
import 'package:karz/core/usecases/usecases.dart';
import 'package:karz/features/evaluation/domain/entities/evaluation_entity.dart';
import 'package:karz/features/evaluation/domain/repositories/evaluation_repository.dart';

class CreateEvaluation extends UseCaseWithParameters<void, EvaluationEntity> {
  CreateEvaluation(this._repository);

  final EvaluationRepositoy _repository;

  @override
  ResultFuture<void> call(EvaluationEntity args) => _repository.createEvaluation(args); 
}