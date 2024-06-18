import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:partyguam/presentation/pages/sign_up/cubit/user_cubit.dart';

import '../../routes/route_path.dart';
import '../../theme/colors.dart';
import '../../theme/styles.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/buttons.dart';

class Main1100 extends StatelessWidget {
  const Main1100({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SignInAppBar(title: '메인'),
      body: Column(
        children: [
          Text('메인 페이지에 오신걸 환영합니다!'),
          _buildNextButton(context),
          const SizedBox(height: 20),
          buildFilledLongButton(
            context,
            '세부프로필 페이지',
            '${RouterPath.signUp}/detail/0121',
          ),
        ],
      ),
    );
  }

  Widget _buildNextButton(BuildContext context) {
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
            context.read<UserCubit>().resetUserCubitState();
            context.push(RouterPath.signUp);
          },
          style: CommonButtonStyles.filledLongStyle,
          child: const Text('회원가입 페이지'),
        ),
      ),
    );
  }
}
