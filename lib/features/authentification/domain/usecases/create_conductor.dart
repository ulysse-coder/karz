
import 'package:karz/core/typedef/typedef.dart';
import 'package:karz/core/usecases/usecases.dart';
import 'package:karz/features/authentification/domain/entities/conductor_entity.dart';
import 'package:karz/features/authentification/domain/repositories/authentication_repository.dart';

class CreateConductor extends UseCaseWithParameters<void, ConductorEntity> {
  const CreateConductor(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<void> call(ConductorEntity args) => _repository.createConductor(conductor: args);
}