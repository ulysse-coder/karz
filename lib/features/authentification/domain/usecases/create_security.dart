
import 'package:ulysse_app/core/typedef/typedef.dart';
import 'package:ulysse_app/core/usecases/usecases.dart';
import 'package:ulysse_app/features/authentification/domain/entities/security_entity.dart';
import 'package:ulysse_app/features/authentification/domain/repositories/authentication_repository.dart';

class CreateSecurity extends UseCaseWithParameters<void, SecurityEntity> {
  const CreateSecurity(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<void> call(SecurityEntity args) => _repository.createSecurity(security: args);
}