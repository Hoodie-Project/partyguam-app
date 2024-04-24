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
