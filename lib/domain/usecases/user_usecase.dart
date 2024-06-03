import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import '../../core/index.dart';
import '../index.dart';

@Injectable()
class SendUserCredentials
    extends UsecaseWithParams<void, SendUserCredentialParams> {
  const SendUserCredentials(this._repository);

  final UserCredentialRepository _repository;

  /**
   * implement an abstract class for usecase to make an return type identical.
   * the below code is the same as @override call().
   * */

  /*
  ApiResult<UserCredential> sendUserCredential({
    required String uid,
    required String idToken,
  }) async =>
      _repository.sendUserCredential(
        uid: uid,
        idToken: idToken,
      );
   */

  @override
  ApiAuthResult<AuthTokens> call(SendUserCredentialParams params) async =>
      _repository.sendUserCredential(
        uid: params.uid,
        idToken: params.idToken,
      );
}

class SendUserCredentialParams extends Equatable {
  const SendUserCredentialParams({
    required this.uid,
    required this.idToken,
  });

  final String uid;
  final String idToken;

  @override
  List<Object?> get props => [uid];
}

Future<String?> encryptUserId(String uid) async {
  try {
    final key =
        encrypt.Key.fromUtf8(dotenv.env['APP_CIPHERIV_KEY_SECRET'] as String);
    final iv =
        encrypt.IV.fromUtf8(dotenv.env['APP_CIPHERIV_IV_SECRET'] as String);

    final cbcEncryptor =
        encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));

    final encryptedData = cbcEncryptor.encrypt(uid, iv: iv);

    return encryptedData.base64;
  } on FlutterException catch (e) {
    FlutterFailure.fromException(
      FlutterException(message: e.message, statusCode: e.statusCode),
    );
  }
}

Future<void> kakaoLogOut() async {
  try {
    await UserApi.instance.logout();
    print('Kakao logout success, SDK에서 토큰 삭제');
  } catch (error) {
    print('Kakao logout failure, SDK에서 토큰 삭제: $error');
  }
}
