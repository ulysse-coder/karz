
import 'package:equatable/equatable.dart';
import 'package:ulysse_app/core/typedef/typedef.dart';
import 'package:ulysse_app/core/usecases/usecases.dart';
import 'package:ulysse_app/core/utilities/enum.dart';
import 'package:ulysse_app/features/authentification/domain/repositories/authentication_repository.dart';

class CreateUser extends UseCaseWithParameters<void, CreateUserParams> {
  const CreateUser(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<void> call(CreateUserParams args) => _repository.createUser(
    args.id, 
    args.name, 
    args.role, 
    args.workDuration, 
    args.startAt, 
    args.endAt
  );

}

class CreateUserParams extends Equatable {
  const CreateUserParams({
    required this.id, 
    required this.name, 
    required this.role, 
    required this.workDuration, 
    required this.startAt, 
    required this.endAt, 
  });

  final String id;
  final String name;
  final UserRole role;
  final int workDuration;
  final DateTime startAt;
  final DateTime endAt;

  @override
  List<Object?> get props => [id, name, role, workDuration, startAt, endAt];
}