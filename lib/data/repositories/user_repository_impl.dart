import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/index.dart';
import '../../domain/index.dart';
import '../index.dart';

@LazySingleton(as: UserCredentialRepository)
class UserCredentialRepositoryImpl implements UserCredentialRepository {
  const UserCredentialRepositoryImpl(
    this._remoteDataSource,
    this._oauthDataSource,
  );

  /// DI (Dependency Inversion)
  final UserCredentialDataSource _remoteDataSource;
  final AuthDataSource _oauthDataSource;

  @override
  ApiAuthResult<AuthTokens> sendUserCredential({
    required String uid,
    required String idToken,
  }) async {
    try {
      // TDD
      // 1. call the remote data source.
      // 2. check if the method returns the proper data.
      // 3. make sure that it returns the proper data if there is no exception.
      // 4. check if when the remote data source throws an exception, return a failure.

      final encryptedUid = await encryptUserId(uid);

      final response = await _remoteDataSource.sendUserCredential(
        uid: encryptedUid!,
        idToken: idToken,
      );

      /// when the return type is void, return Right(null);
      /// https://youtu.be/_E3EF1jPumM?si=QHdkpZkNTqzk9al3
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
