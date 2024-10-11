
import 'package:dartz/dartz.dart';
import 'package:karz/core/errors/db_exception.dart';
import 'package:karz/core/typedef/typedef.dart';
import 'package:karz/features/evaluation/data/data_sources/remote/evaluation_remote_data_source.dart';
import 'package:karz/features/evaluation/data/models/evaluation_model.dart';
import 'package:karz/features/evaluation/domain/entities/evaluation_entity.dart';
import 'package:karz/features/evaluation/domain/repositories/evaluation_repository.dart';

class EvaluationRepositoryImplementation implements EvaluationRepositoy {
  const EvaluationRepositoryImplementation(this._remoteDataSource);

  final EvaluationRemoteDataSource _remoteDataSource;

  @override
  ResultVoid createEvaluation(EvaluationEntity evaluation) async {
    try {
      await _remoteDataSource.createEvaluation(evaluation as EvaluationModel);

      return const Right(null);

    } catch (e) {
      return Left(DBException(message: e.toString()));
    }
  }
}