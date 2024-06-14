import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import '../../core/index.dart';
import '../../data/index.dart';
import '../index.dart';

// SendUserCredentials
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
  ApiResult<void> call(SendUserCredentialParams params) async =>
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
  return null;
}

// CheckUserNickname
@Injectable()
class CheckUserNickname
    extends UsecaseWithParams<void, CheckUserNicknameParams> {
  const CheckUserNickname(this._repository);

  final UserSignUpRepository _repository;

  @override
  ApiResult<SuccessDto> call(CheckUserNicknameParams params) async =>
      _repository.checkUserNickname(nickname: params.nickname);
}

class CheckUserNicknameParams extends Equatable {
  const CheckUserNicknameParams({
    required this.nickname,
  });

  final String nickname;

  @override
  List<Object?> get props => [nickname];
}

// CreateUser
@Injectable()
class CreateUser extends UsecaseWithParams<void, CreateUserParams> {
  const CreateUser(this._repository);

  final UserSignUpRepository _repository;

  @override
  ApiResult<void> call(CreateUserParams params) async => _repository.createUser(
        email: params.email,
        nickname: params.nickname,
        birth: params.birth,
        gender: params.gender,
      );
}

class CreateUserParams extends Equatable {
  const CreateUserParams({
    required this.email,
    required this.nickname,
    required this.birth,
    required this.gender,
  });

  final String email;
  final String nickname;
  final String birth;
  final String gender;

  @override
  List<Object?> get props => [email];
}

//
Future<void> kakaoLogOut() async {
  try {
    await UserApi.instance.logout();
    print('Kakao logout success, SDK에서 토큰 삭제');
  } catch (error) {
    print('Kakao logout failure, SDK에서 토큰 삭제: $error');
  }
}
