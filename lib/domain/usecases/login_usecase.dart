import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

Future<void> signInWithKakao(BuildContext context) async {
  navigateToNextPage(BuildContext context) {
    context.go('/sign_up/0111');
    debugPrint('Kakao login Succeed');
  }

  // 카카오톡 실행 가능 여부 확인
  if (await isKakaoTalkInstalled()) {
    try {
      await UserApi.instance.loginWithKakaoTalk().then((value) {
        /// TODO: ID 토큰 유효성 검사 추가
        /// https://developers.kakao.com/docs/latest/ko/kakaologin/common#oidc
        if (context.mounted) {
          navigateToNextPage(context);
        } else {
          throw Exception('Mounted Error');
        }
      });
    } catch (error) {
      debugPrint('KakaoTalk login failure $error');

      // 사용자의 의도적인 로그인 취소 (예: 뒤로가기)
      if (error is PlatformException && error.code == 'CANCELED') {
        return;
      }
      // 카카오톡에 연결된 카카오 계정이 없는 경우, 카카오 계정으로 로그인
      try {
        await UserApi.instance.loginWithKakaoAccount();
        if (context.mounted) {
          navigateToNextPage(context);
        } else {
          throw Exception('Mounted Error');
        }
      } catch (error) {
        debugPrint('KakaoAccount login failure $error');
      }
    }
  } else {
    // 카카오톡이 설치 되어있지 않은 경우, 카카오 계정으로 로그인
    try {
      await UserApi.instance.loginWithKakaoAccount().then((value) {
        if (context.mounted) {
          navigateToNextPage(context);
        }
      });
    } catch (error) {
      print('KakaoAccount login failure $error');
    }
  }
}
