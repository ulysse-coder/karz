
import 'package:dartz/dartz.dart';
import 'package:ulysse_app/core/errors/db_exception.dart';
import 'package:ulysse_app/core/typedef/typedef.dart';
import 'package:ulysse_app/features/evaluation/data/data_sources/remote/evaluation_remote_data_source.dart';
import 'package:ulysse_app/features/evaluation/data/models/evaluation_model.dart';
import 'package:ulysse_app/features/evaluation/domain/entities/evaluation_entity.dart';
import 'package:ulysse_app/features/evaluation/domain/repositories/evaluation_repository.dart';

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