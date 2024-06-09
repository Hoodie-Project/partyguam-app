import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:partyguam/main.dart';

import '../../../core/index.dart';

abstract class AuthDataSource {
  Future<OAuthToken?> signInWithKakao();

  Future<User?> getKakaoUserInfo();

// Future<void> signInWithGoogle();
}

@LazySingleton(as: AuthDataSource)
class AuthDataSourceImpl implements AuthDataSource {
  late OAuthToken tokens;

  @override
  Future<OAuthToken?> signInWithKakao() async {
    // 카카오톡 실행 가능 여부 확인
    if (await isKakaoTalkInstalled()) {
      try {
        tokens = await UserApi.instance.loginWithKakaoTalk();
      } catch (error) {
        debugPrint('KakaoTalk login failure: $error');

        // 사용자의 의도적인 로그인 취소 (예: 뒤로가기)
        if (error is PlatformException && error.code == 'CANCELED') {
          return null;
        }
        // 카카오톡에 연결된 카카오 계정이 없는 경우, 카카오 계정으로 로그인
        try {
          tokens = await UserApi.instance.loginWithKakaoAccount();
        } catch (error) {
          debugPrint('KakaoAccount login failure: $error');
        }
      }
    } else {
      // 카카오톡이 설치 되어있지 않은 경우, 카카오 계정으로 로그인
      try {
        tokens = await UserApi.instance.loginWithKakaoAccount();

        print(tokens);
      } catch (error) {
        debugPrint('KakaoAccount login failure: $error');
      }
    }

    /// TODO (20240603): 더 좋은 방법 고민 해보기
    await localStorage.setString('kakaoAccessToken', tokens.accessToken);
    await localStorage.setString(
        'kakaoRefreshToken', tokens.refreshToken ?? '');
    await localStorage.setString('kakaoIdToken', tokens.idToken ?? '');

    return tokens;
  }

  @override
  Future<User?> getKakaoUserInfo() async {
    try {
      User response = await UserApi.instance.me();

      return response;
    } catch (e) {
      throw ApiException(message: e.toString(), statusCode: 505);
    }
  }
}
