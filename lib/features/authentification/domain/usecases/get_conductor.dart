
import 'package:karz/core/typedef/typedef.dart';
import 'package:karz/core/usecases/usecases.dart';
import 'package:karz/features/authentification/domain/entities/conductor_entity.dart';
import 'package:karz/features/authentification/domain/repositories/authentication_repository.dart';

class GetConductor extends UseCaseWithParameters<ConductorEntity, String> {
  const GetConductor(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<ConductorEntity> call(String args) => _repository.getConductor(id: args);
}