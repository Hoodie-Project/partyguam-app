import 'dart:core';

import 'package:dartz/dartz.dart';

import '../../domain/index.dart';
import 'error.dart';

typedef ApiResult<T> = Future<Either<Failure, T>>;

typedef ApiResultVoid = ApiResult<void>;

typedef ApiAuthResult<T> = Future<Either<SignUpAuthToken, T>>;

typedef DataMap = Map<String, dynamic>;
