
import 'package:karz/core/typedef/typedef.dart';
import 'package:karz/core/usecases/usecases.dart';
import 'package:karz/features/authentification/domain/entities/security_entity.dart';
import 'package:karz/features/authentification/domain/repositories/authentication_repository.dart';

class CreateSecurity extends UseCaseWithParameters<void, SecurityEntity> {
  const CreateSecurity(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<void> call(SecurityEntity args) => _repository.createSecurity(security: args);
}