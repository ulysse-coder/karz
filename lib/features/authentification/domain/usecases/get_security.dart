
import 'package:ulysse_app/core/typedef/typedef.dart';
import 'package:ulysse_app/core/usecases/usecases.dart';
import 'package:ulysse_app/features/authentification/domain/entities/security_entity.dart';
import 'package:ulysse_app/features/authentification/domain/repositories/authentication_repository.dart';

class GetSecurity extends UseCaseWithParameters<SecurityEntity, String> {
  const GetSecurity(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<SecurityEntity> call(String args) => _repository.getSecurity(id: args);
}