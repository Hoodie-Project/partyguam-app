import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/usecases/user_usecase.dart';
import '../../../theme/colors.dart';
import '../../../theme/icons.dart';
import '../widgets/app_bar.dart';
import '../widgets/text.dart';

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
              _buildSocialLoginButton(
                '카카오톡 로그인',
                const Color(0XFFFEE500),
                kakaoIcon,
              ),
              const SizedBox(
                height: 8.0,
              ),
              _buildSocialLoginButton(
                '구글 로그인',
                AppColors.greyColors.shade50,
                googleIcon,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: _buildTermText(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: _buildInquiryText(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialLoginButton(
      String text, Color backgroundColor, Widget icon) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () async {
          if (text == '카카오톡 로그인') {
            await signInWithKakao(context);
          } else if (text == '구글 로그인') {
            context.push('/sign_up/0111');
          }
        },
        style: ElevatedButton.styleFrom(
          alignment: Alignment.centerLeft,
          backgroundColor: backgroundColor,
          elevation: 1,
          foregroundColor: AppColors.greyColors.shade700,
          padding: const EdgeInsets.only(
            left: 20.0,
          ),
          minimumSize: const Size(
            335.0,
            52.0,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          textStyle: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        icon: icon,
        label: Text(text),
      ),
    );
  }

  Widget _buildTermText() {
    return RichText(
      text: TextSpan(
        text: '소셜 로그인 가입 시 ',
        style: TextStyle(
          color: AppColors.greyColors.shade700,
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
        ),
        children: const [
          TextSpan(
            text: '이용약관 개인정보처리방침 전자금융거래약관 \n결제/환불약관',
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.underline,
            ),
          ),
          TextSpan(text: '에 동의한 것으로 간주합니다.')
        ],
      ),
    );
  }

  Widget _buildInquiryText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            '문의하기',
            style: TextStyle(
              color: AppColors.greyColors.shade500,
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}
