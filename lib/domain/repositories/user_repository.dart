import 'package:partyguam/domain/index.dart';

import '../../core/index.dart';

abstract class UserCredentialRepository {
  const UserCredentialRepository();

  ApiResult<UserCredential> sendUserCredential({
    required String uid,
    required String idToken,
  });
}

abstract class UserRepository {
  const UserRepository();

  ApiResult<UserNickname> checkNickname({
    required String nickname,
  });
}
