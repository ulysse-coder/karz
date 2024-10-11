
import 'package:equatable/equatable.dart';
import 'package:karz/core/utilities/enum.dart';

class UserEntity extends Equatable {
  const UserEntity({
    required this.uid,
    required this.name,
    required this.phone,
    required this.role,
  });

  final String uid;
  final String name;
  final String phone;
  final UserRole role;

  @override
  List<Object?> get props => [uid, name, phone, role];
}