
import 'package:ulysse_app/core/typedef/typedef.dart';
import 'package:ulysse_app/core/usecases/usecases.dart';
import 'package:ulysse_app/core/utilities/auth_params.dart';
import 'package:ulysse_app/features/authentification/domain/repositories/authentication_repository.dart';

class CheckIfUserExist extends UseCaseWithParameters<bool, UserURParams> {
  const CheckIfUserExist(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<bool> call(UserURParams args) => _repository.checkIfUserExist(args.uid, args.role);
}