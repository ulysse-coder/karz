
import 'package:ulysse_app/core/typedef/typedef.dart';
import 'package:ulysse_app/core/usecases/usecases.dart';
import 'package:ulysse_app/core/utilities/auth_params.dart';
import 'package:ulysse_app/features/authentification/domain/entities/conductor_entity.dart';
import 'package:ulysse_app/features/authentification/domain/repositories/authentication_repository.dart';

class SiginWithEmailAndPassword extends UseCaseWithParameters<ConductorEntity, AuthParams> {
  const SiginWithEmailAndPassword(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<ConductorEntity> call(AuthParams args) => _repository.siginWithEmailAndPassword(args.email, args.password);

}

