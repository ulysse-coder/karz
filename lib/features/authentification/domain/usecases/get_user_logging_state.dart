
import 'package:ulysse_app/core/typedef/typedef.dart';
import 'package:ulysse_app/core/usecases/usecases.dart';
import 'package:ulysse_app/features/authentification/domain/repositories/authentication_repository.dart';

class GetUserLoggingState extends UseCaseWithoutParameters<bool> {
  const GetUserLoggingState(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<bool> call() => _repository.getUserLoggingState();
}