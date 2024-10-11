
import 'package:karz/core/typedef/typedef.dart';
import 'package:karz/core/usecases/usecases.dart';
import 'package:karz/core/utilities/auth_params.dart';
import 'package:karz/features/authentification/domain/repositories/authentication_repository.dart';

class CheckIfUserExist extends UseCaseWithParameters<bool, UserURParams> {
  const CheckIfUserExist(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<bool> call(UserURParams args) => _repository.checkIfUserExist(args.uid, args.role);
}