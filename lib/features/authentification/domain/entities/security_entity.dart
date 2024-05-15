
import 'package:equatable/equatable.dart';
import 'package:ulysse_app/core/utilities/enum.dart';

class SecurityEntity extends Equatable {
  const SecurityEntity({
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