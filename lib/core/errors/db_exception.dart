
import 'package:equatable/equatable.dart';

class DBException extends Equatable implements Exception {
  const DBException({required this.message});

  final String message;

  @override
  List<Object?> get props =>[message];
}