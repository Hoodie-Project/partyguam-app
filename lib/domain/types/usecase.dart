import '../../core/index.dart';

abstract class UsecaseWithParams<Type, Params> {
  const UsecaseWithParams();

  ApiAuthResult<Type> call(Params params);
}

// abstract class UsecaseWithoutParams<Type> {
//   const UsecaseWithParams();
//
//   ApiAuthResult<Type> call(Params params);
// }

abstract class UsecaseWithoutParams<Type> {
  const UsecaseWithoutParams();

  ApiResult<Type> call();
}

/**
 * call()
 * dart inherited method for all kinds of functions.
 * Anything inside of call() will be executed without calling method.
 * in this case, final result = UsecaseWithoutParams();
 * */
