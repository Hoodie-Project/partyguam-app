import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:partyguam/presentation/pages/sign_up/cubit/user_cubit.dart';

import '../../../routes/route_path.dart';
import '../../../theme/colors.dart';
import '../../../theme/styles.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/process_indicator.dart';
import '../../../widgets/text.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/user_form_cubit.dart';
import 'styles.dart';

class SignUp0111 extends StatefulWidget {
  const SignUp0111({super.key});

  @override
  State<SignUp0111> createState() => _SignUp0111State();
}

class _SignUp0111State extends State<SignUp0111> {
  @override
  void initState() {
    super.initState();

    context.read<AuthCubit>().getKakaoUserInfo();
  }

  @override
  void dispose() {
    context.read<AuthCubit>().getKakaoUserInfo();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // signUp0112에서 접근 했을 때
        if (state is AuthInitial) {
          context.read<AuthCubit>().getKakaoUserInfo();
        } else if (state is OauthUnAuthenticated) {
          /// TODO (20240602): 예상하지 못한 오류 발생 팝업 디자인 필요
          debugPrint('예상치 못한 오류 발생;');
          context.go(RouterPath.main);
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: const DialogAppBar(
              title: '가입하기',
              pageCount: '1/4',
            ),
            body: state is GetKakaoUserInfoComplete
                ? Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, top: 40.0, right: 20.0, bottom: 12.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildTitleText(
                            '가입을 축하드려요!\n이메일 정보가 맞나요?',
                            '나중에 변경할 수 없어요.',
                          ),
                          _buildEmailConfirmForm(state.email),
                          const Expanded(
                            child: SizedBox(),
                          ),
                          _buildNextButton(context, state.uid, state.email!),
                        ],
                      ),
                    ),
                  )
                : Center(child: buildProgressIndicator()));
      },
    );
  }

  Widget _buildEmailConfirmForm(String? email) {
    return SizedBox(
      width: double.infinity,
      child: Material(
        color: AppColors.greyColors.shade50,
        elevation: 1.0,
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        child: Container(
          height: 52.0,
          padding: const EdgeInsets.only(left: 20.0, top: 15.0, bottom: 15.0),
          decoration: BoxDecoration(
            color: AppColors.greyColors.shade100,
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          ),
          child: email != null
              ? Text(
                  email,
                  style: SignUp0111Styles.emailText,
                )
              : const Text(''),
        ),
      ),
    );
  }

  Widget _buildNextButton(BuildContext context, String uid, String email) {
    return SizedBox(
      width: double.infinity,
      child: Material(
        color: AppColors.greyColors.shade50,
        elevation: 1.0,
        borderRadius: const BorderRadius.all(
          Radius.circular(16.0),
        ),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              context.read<UserCubit>().sendUserCredentials(uid);
              context.read<UserFormCubit>().setEmail(email);
              context.push('${RouterPath.signUp}/0112');
            });
          },
          style: CommonButtonStyles.filledLongStyle,
          child: const Text('네, 맞아요'),
        ),
      ),
    );
  }
}
