import 'package:dartz/dartz.dart';

import 'error.dart';

typedef ApiResult<T> = Future<Either<Failure, T>>;
