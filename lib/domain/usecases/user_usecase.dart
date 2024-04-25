import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

Future<void> signInWithKakao(BuildContext context) async {
  // 카카오톡 실행 가능 여부 확인
  if (await isKakaoTalkInstalled()) {
    try {
      await UserApi.instance.loginWithKakaoTalk().then((value) {
        print(value);
        if (context.mounted) {
          navigateToNextPage(context);
        } else {
          throw Exception('Mounted Error');
        }
      });
    } catch (error) {
      debugPrint('KakaoTalk login failure: $error');

      // 사용자의 의도적인 로그인 취소 (예: 뒤로가기)
      if (error is PlatformException && error.code == 'CANCELED') {
        return;
      }
      // 카카오톡에 연결된 카카오 계정이 없는 경우, 카카오 계정으로 로그인
      try {
        await UserApi.instance.loginWithKakaoAccount().then(
          (value) {
            print(value);
            if (context.mounted) {
              navigateToNextPage(context);
            } else {
              throw Exception('Mounted Error');
            }
          },
        );
      } catch (error) {
        debugPrint('KakaoAccount login failure: $error');
      }
    }
  } else {
    // 카카오톡이 설치 되어있지 않은 경우, 카카오 계정으로 로그인
    try {
      await UserApi.instance.loginWithKakaoAccount().then(
        (value) {
          print(value);
          if (context.mounted) {
            navigateToNextPage(context);
          }
        },
      );
    } catch (error) {
      print('KakaoAccount login failure: $error');
    }
  }
}

Future<void> navigateToNextPage(BuildContext context) async {
  await getKakaoUserInfo();

  context.push('/sign_up/0111');
  debugPrint('Kakao login success');
}

Future<String?> getKakaoUserInfo() async {
  try {
    User user = await UserApi.instance.me();
    String? email = user.kakaoAccount?.email;
    int userId = user.id;

    if (email == null) {
      throw Exception('No email provided');
    }

    await encryptUserId(userId);

    return email;
  } catch (error) {
    print('Failed to fetch kakaouser info: $error');
  }
}

Future<encrypt.Encrypted> encryptUserId(int userId) async {
  final userIdToString = userId.toString();
  final key =
      encrypt.Key.fromUtf8(dotenv.env['APP_CIPHERIV_KEY_SECRET'] as String);
  final iv = encrypt.IV.fromLength(16);
  final encrypter = encrypt.Encrypter(
    encrypt.AES(
      key,
      mode: encrypt.AESMode.cbc,
    ),
  );

  final encrypted = encrypter.encrypt(
    userIdToString,
    iv: iv,
  );

  return encrypted;
}

Future<void> kakaoLogOut() async {
  try {
    await UserApi.instance.logout();
    print('Kakao logout success, SDK에서 토큰 삭제');
  } catch (error) {
    print('Kakao logout failure, SDK에서 토큰 삭제: $error');
  }
}
