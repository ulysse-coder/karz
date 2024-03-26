
import 'package:equatable/equatable.dart';
import 'package:ulysse_app/core/utilities/enum.dart';

class UserEntity extends Equatable {
  const UserEntity({
    required this.uid,
    required this.name,
    required this.role,
    required this.photo
  });

  final String uid;
  final String name;
  final UserRole role;
  final String photo;

  @override
  List<Object?> get props => [uid, name, role, photo];
}