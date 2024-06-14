import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/index.dart';
import '../../domain/index.dart';
import '../index.dart';

@LazySingleton(as: UserSignUpRepository)
class UserSignUpRepositoryImpl implements UserSignUpRepository {
  const UserSignUpRepositoryImpl(this._remoteDataSource);

  final UserDataSource _remoteDataSource;

  @override
  ApiResult<void> sendUserCredential({
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

      await _remoteDataSource.sendUserCredential(
        uid: encryptedUid!,
        idToken: idToken,
      );

      /// https://youtu.be/_E3EF1jPumM?si=QHdkpZkNTqzk9al3
      return const Right(null);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ApiResult<ResponseDto> checkUserNickname({required String nickname}) async {
    try {
      final response =
          await _remoteDataSource.checkUserNickname(nickname: nickname);

      return Right(response);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ApiResult<AccessTokenDto> createUser({
    required String email,
    required String nickname,
    required String birth,
    required String gender,
  }) async {
    try {
      final response = await _remoteDataSource.createUser(
        email: email,
        nickname: nickname,
        birth: birth,
        gender: gender,
      );

      return Right(response);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ApiResult<UserInformation> getUserInformation() {
    // TODO: implement getUserInformation
    throw UnimplementedError();
  }
}
