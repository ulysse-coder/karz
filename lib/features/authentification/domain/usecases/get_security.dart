
import 'package:karz/core/typedef/typedef.dart';
import 'package:karz/core/usecases/usecases.dart';
import 'package:karz/features/authentification/domain/entities/security_entity.dart';
import 'package:karz/features/authentification/domain/repositories/authentication_repository.dart';

class GetSecurity extends UseCaseWithParameters<SecurityEntity, String> {
  const GetSecurity(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<SecurityEntity> call(String args) => _repository.getSecurity(id: args);
}