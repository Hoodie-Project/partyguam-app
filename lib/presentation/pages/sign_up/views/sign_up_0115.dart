import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../routes/route_path.dart';
import '../../../theme/colors.dart';
import '../../../theme/styles.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/buttons.dart';
import '../cubit/user_form_cubit.dart';
import 'styles.dart';

class SignUp0115 extends StatelessWidget {
  const SignUp0115({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NoIconsAppBar(title: '가입완료'),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Center(
              child: Text(
                textAlign: TextAlign.center,
                '가입을 축하합니다!\n세부 프로필을 작성해 볼까요?',
                style: SignUp0115Styles.mainTitle,
              ),
            ),
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: buildOutlinedShortButton(
                    context,
                    '홈으로 이동',
                    RouterPath.signIn,
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: _buildNextButton(context),
                ),
              ],
            ),
          ],
        ),
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
            context.read<UserFormCubit>().createUser();
            context.push('${RouterPath.signUp}/detail/0121');
          },
          style: CommonButtonStyles.filledLongStyle,
          child: const Text('작성하기'),
        ),
      ),
    );
  }
}
