import '../../core/index.dart';
import '../index.dart';

abstract class UserCredentialRepository {
  const UserCredentialRepository();

  ApiAuthResult<AuthTokens> sendUserCredential({
    required String uid,
    required String idToken,
  });
}

abstract class UserRepository {
  const UserRepository();

  ApiResult<UserNickname> checkNickname({
    required String nickname,
  });

  ApiResult<UserInformation> getUserInformation();
}
