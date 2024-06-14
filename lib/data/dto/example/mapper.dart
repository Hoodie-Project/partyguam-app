// example

import 'package:partyguam/data/dto/user/user_credential_dto.dart';
import 'package:partyguam/domain/index.dart';

extension UserCredentialMapper on UserCredentialDto {
  UserCredential toEntity() {
    return UserCredential(uid: uid, idToken: idToken);
  }
}
