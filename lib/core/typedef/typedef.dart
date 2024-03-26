
import 'package:dartz/dartz.dart';

typedef ResultFuture<T> = Future<Either<T, Exception>>;
typedef ResultVoid = ResultFuture<void>;
typedef ResultBool = ResultFuture<bool>;