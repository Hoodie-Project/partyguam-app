import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import '../../core/index.dart';
import '../../domain/index.dart';
import '../index.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._oauthDataSource);

  final AuthDataSource _oauthDataSource;

  @override
  ApiResult<OAuthToken?> signInWithKakao() async {
    try {
      final response = await _oauthDataSource.signInWithKakao();

      return Right(response);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ApiResult<User?> getKakaoUserInfo() async {
    try {
      final response = await _oauthDataSource.getKakaoUserInfo();

      return Right(response);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }
}
