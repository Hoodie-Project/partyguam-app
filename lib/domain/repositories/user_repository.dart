import '../../core/index.dart';
import '../index.dart';

abstract class UserCredentialRepository {
  const UserCredentialRepository();

  ApiAuthResult<AuthTokens> sendUserCredential();
}

abstract class UserRepository {
  const UserRepository();

  ApiResult<UserNickname> checkNickname({
    required String nickname,
  });

  ApiResult<UserInformation> getUserInformation();
}
