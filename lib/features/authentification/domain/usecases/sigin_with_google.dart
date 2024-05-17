
import 'package:ulysse_app/core/typedef/typedef.dart';
import 'package:ulysse_app/core/usecases/usecases.dart';
import 'package:ulysse_app/features/authentification/domain/entities/conductor_entity.dart';
import 'package:ulysse_app/features/authentification/domain/repositories/authentication_repository.dart';

class SiginWithGoogle extends UseCaseWithoutParameters<ConductorEntity> {
  const SiginWithGoogle(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<ConductorEntity> call() => _repository.siginWithGoogle();
}