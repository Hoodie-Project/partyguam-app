import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import '../../core/index.dart';

abstract class AuthRepository {
  ApiResult<OAuthToken?> signInWithKakao();

  ApiResult<User?> getKakaoUserInfo();
}
