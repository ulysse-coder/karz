
import 'package:ulysse_app/core/typedef/typedef.dart';
import 'package:ulysse_app/core/usecases/usecases.dart';
import 'package:ulysse_app/core/utilities/auth_params.dart';
import 'package:ulysse_app/features/authentification/domain/entities/user_entity.dart';
import 'package:ulysse_app/features/authentification/domain/repositories/authentication_repository.dart';

class GetCurrentUser extends UseCaseWithParameters<UserEntity, GetCurrentUserParams> {
  const GetCurrentUser(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<UserEntity> call(GetCurrentUserParams args) => _repository.getCurrentUser(args.uid, args.role);
}