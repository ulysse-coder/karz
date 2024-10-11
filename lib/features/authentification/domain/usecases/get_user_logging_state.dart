
import 'package:karz/core/typedef/typedef.dart';
import 'package:karz/core/usecases/usecases.dart';
import 'package:karz/features/authentification/domain/repositories/authentication_repository.dart';

class GetUserLoggingState extends UseCaseWithoutParameters<bool> {
  const GetUserLoggingState(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<bool> call() => _repository.getUserLoggingState();
}