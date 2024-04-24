import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../../theme/icons.dart';
import 'widgets/app_bar.dart';
import 'widgets/components.dart';
import 'widgets/text.dart';

class Login0000 extends StatefulWidget {
  const Login0000({super.key});

  @override
  State<Login0000> createState() => _Login0000State();
}

class _Login0000State extends State<Login0000> {
  @override
  Widget build(BuildContext context) {
//     void signInWithKakao() async {
//       // 카카오 로그인 구현 예제
//
// // 카카오톡 실행 가능 여부 확인
// // 카카오톡 실행이 가능하면 카카오톡으로 로그인, 아니면 카카오계정으로 로그인
//       if (await isKakaoTalkInstalled()) {
//         try {
//           await UserApi.instance.loginWithKakaoTalk();
//           print('카카오톡으로 로그인 성공');
//         } catch (error) {
//           print('카카오톡으로 로그인 실패 $error');
//
//           // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
//           // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
//           if (error is PlatformException && error.code == 'CANCELED') {
//             return;
//           }
//           // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
//           try {
//             await UserApi.instance.loginWithKakaoAccount();
//             print('카카오계정으로 로그인 성공');
//           } catch (error) {
//             print('카카오계정으로 로그인 실패 $error');
//           }
//         }
//       } else {
//         try {
//           await UserApi.instance.loginWithKakaoAccount();
//           print('카카오계정으로 로그인 성공');
//         } catch (error) {
//           print('카카오계정으로 로그인 실패 $error');
//         }
//       }
//     }

    return Scaffold(
      appBar: const LoginAppBar(
        title: '로그인',
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 40.0, right: 20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleText(
                mainTitle: '파티괌과 함께\n파티에 참여할 준비가 되셨나요?',
                subTitle: '소셜 로그인으로 편하게 이용해보세요.',
              ),
              SocialLoginButton(
                text: '카카오톡 로그인',
                icon: kakaoIcon,
                backgroundColor: const Color(0XFFFEE500),
                route: '/sign_up/0111',
              ),
              const SizedBox(
                height: 8.0,
              ),
              SocialLoginButton(
                text: '구글 로그인',
                icon: googleIcon,
                backgroundColor: AppColors.greyColors.shade50,
                route: '/sign_up/0112',
              ),
              const Padding(
                padding: EdgeInsets.only(top: 32.0),
                child: TermText(),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 24.0),
                child: SignUpTextButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
