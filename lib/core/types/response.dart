import 'dart:core';

import 'package:dartz/dartz.dart';

import '../../domain/entities/auth/sign_up_auth_token.dart';
import 'error.dart';

typedef ApiResult<T> = Future<Either<Failure, T>>;

typedef ApiResultVoid = ApiResult<void>;

typedef ApiAuthResult<T> = Future<Either<SignUpAuthToken, T>>;

typedef DataMap = Map<String, dynamic>;
