
import 'package:karz/core/typedef/typedef.dart';
import 'package:karz/core/usecases/usecases.dart';
import 'package:karz/features/authentification/domain/repositories/authentication_repository.dart';

class SetUserLoggingState extends UseCaseWithoutParameters<void> {
  const SetUserLoggingState(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<void> call() => _repository.setUserLoggingState();
}