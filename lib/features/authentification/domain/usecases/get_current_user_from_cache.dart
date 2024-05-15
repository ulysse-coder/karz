
import 'package:ulysse_app/core/typedef/typedef.dart';
import 'package:ulysse_app/core/usecases/usecases.dart';
import 'package:ulysse_app/features/authentification/data/models/conductor_model.dart';
import 'package:ulysse_app/features/authentification/data/models/conductor_model.dart';
import 'package:ulysse_app/features/authentification/domain/entities/conductor_entity.dart';
import 'package:ulysse_app/features/authentification/domain/entities/conductor_entity.dart';
import 'package:ulysse_app/features/authentification/domain/entities/user_entity.dart';
import 'package:ulysse_app/features/authentification/domain/repositories/authentication_repository.dart';

class GetCurrentUserFromCache extends UseCaseWithoutParameters<ConductorEntity> {
  const GetCurrentUserFromCache(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<ConductorEntity> call() => _repository.getCurrentUserFromCache();
}