import 'package:dartz/dartz.dart';

import '../../core/index.dart';
import '../../domain/index.dart';
import '../index.dart';

class UserCredentialRepositoryImpl implements UserCredentialRepository {
  const UserCredentialRepositoryImpl(this._remoteDataSource);

  /// DI (Dependency Inversion)
  final UserCredentialDataSource _remoteDataSource;

  @override
  ApiAuthResult<AuthTokens> sendUserCredential({
    required String uid,
    required String idToken,
  }) async {
    try {
      final response = await _remoteDataSource.sendUserCredential(
        uid: uid,
        idToken: idToken,
      );

      /// when the return type is void, return Right(null);
      return Right(response as AuthTokens);
    } on ApiException catch (e) {
      return const Left(
        // 변경 필요
        SignUpAuthToken(
          signUpAccessToken: 'signUpAccessToken 반환',
        ),
      );
    }
  }
}
