
import 'package:equatable/equatable.dart';

class AuthParams extends Equatable {
  const AuthParams({
    required this.email,
    required this.password
  });

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}