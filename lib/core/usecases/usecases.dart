
import 'package:ulysse_app/core/typedef/typedef.dart';

abstract class UseCaseWithParameters<T, ParamsType> {
  const UseCaseWithParameters();
  ResultFuture<T> call(ParamsType args);

}

abstract class UseCaseWithoutParameters<T> {
  const UseCaseWithoutParameters();
  ResultFuture<T> call();

}