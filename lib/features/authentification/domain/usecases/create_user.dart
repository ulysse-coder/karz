
import 'package:ulysse_app/core/typedef/typedef.dart';
import 'package:ulysse_app/core/usecases/usecases.dart';
import 'package:ulysse_app/core/utilities/auth_params.dart';
import 'package:ulysse_app/features/authentification/domain/repositories/authentication_repository.dart';

class CreateUser extends UseCaseWithParameters<void, UserCreationParams> {
  const CreateUser(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<void> call(UserCreationParams args) => _repository.createUser(args.user, args.role);
}