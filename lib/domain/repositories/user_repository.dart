import '../../core/index.dart';
import '../../data/index.dart';
import '../index.dart';

abstract class UserCredentialRepository {
  const UserCredentialRepository();

  ApiResult<void> sendUserCredential({
    required String uid,
    required String idToken,
  });
}

abstract class UserSignUpRepository {
  const UserSignUpRepository();

  ApiResult<SuccessDto> checkUserNickname({
    required String nickname,
  });

  ApiResult<AccessTokenDto> createUser({
    required String email,
    required String nickname,
    required String birth,
    required String gender,
  });

  ApiResult<UserInformation> getUserInformation();
}
