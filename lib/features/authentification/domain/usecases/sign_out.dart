
import 'package:ulysse_app/core/typedef/typedef.dart';
import 'package:ulysse_app/core/usecases/usecases.dart';
import 'package:ulysse_app/features/authentification/domain/repositories/authentication_repository.dart';

class SignOut extends UseCaseWithoutParameters<void> {
  const SignOut(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<void> call() => _repository.signOut();
}