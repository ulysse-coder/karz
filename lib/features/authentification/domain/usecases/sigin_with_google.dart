
import 'package:karz/core/typedef/typedef.dart';
import 'package:karz/core/usecases/usecases.dart';
import 'package:karz/features/authentification/domain/entities/conductor_entity.dart';
import 'package:karz/features/authentification/domain/repositories/authentication_repository.dart';

class SiginWithGoogle extends UseCaseWithoutParameters<ConductorEntity> {
  const SiginWithGoogle(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<ConductorEntity> call() => _repository.siginWithGoogle();
}