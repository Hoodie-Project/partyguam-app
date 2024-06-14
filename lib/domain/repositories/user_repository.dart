import '../../core/index.dart';
import '../../data/index.dart';
import '../index.dart';

abstract class UserSignUpRepository {
  const UserSignUpRepository();

  ApiResult<void> sendUserCredential({
    required String uid,
    required String idToken,
  });

  ApiResult<ResponseDto> checkUserNickname({
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
