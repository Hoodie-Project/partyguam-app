import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/index.dart';
import '../../../routes/route_path.dart';
import '../../../theme/colors.dart';
import '../../../theme/icons.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/text.dart';
import '../cubit/auth_cubit.dart';
import 'styles.dart';

class SignIn0000 extends StatefulWidget {
  const SignIn0000({super.key});

  @override
  State<SignIn0000> createState() => _SignIn0000State();
}

class _SignIn0000State extends State<SignIn0000> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      context.read<AuthCubit>().isAuthenticated();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is OauthAuthenticated) {
          if (state is Registered) {
            context.go(RouterPath.main);
          }
          context.push('${RouterPath.signUp}/0111');
        } else if (state is OauthUnAuthenticated) {
          context.read<AuthCubit>().isAuthenticated();
        } else {
          return;
        }
      },
      child: Scaffold(
        appBar: const ExitIconAppBar(
          title: '로그인',
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 40.0, right: 20.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTitleText(
                  '파티괌과 함께\n파티에 참여할 준비가 되셨나요?',
                  '소셜 로그인으로 편하게 이용해보세요.',
                ),
                _buildSocialLoginButton(
                  '카카오톡 로그인',
                  const Color(0XFFFEE500),
                  kakaoIcon,
                  () => getIt<AuthCubit>().signInWithKakao(),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                _buildSocialLoginButton(
                  '구글 로그인',
                  AppColors.greyColors.shade50,
                  googleIcon,
                  () => getIt<AuthCubit>().signInWithKakao(),
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
      ),
    );
  }

  Widget _buildSocialLoginButton(
    String text,
    Color backgroundColor,
    Widget icon,
    VoidCallback onPressed,
  ) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          alignment: Alignment.centerLeft,
          backgroundColor: backgroundColor,
          elevation: 1.0,
          foregroundColor: AppColors.greyColors.shade700,
          padding: const EdgeInsets.only(left: 20.0),
          minimumSize: const Size(335.0, 52.0),
          shape: SignIn0000Styles.socialButtonBorder,
          textStyle: SignIn0000Styles.socialButtonText,
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
        style: SignIn0000Styles.termText1,
        children: [
          TextSpan(
            text: '이용약관 개인정보처리방침 전자금융거래약관 \n결제/환불약관',
            style: SignIn0000Styles.termText2,
          ),
          const TextSpan(text: '에 동의한 것으로 간주합니다.')
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
            style: SignIn0000Styles.inquiryText,
          ),
        ),
      ],
    );
  }
}
