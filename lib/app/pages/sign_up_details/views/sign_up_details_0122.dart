import 'package:flutter/material.dart';
import 'package:partyguam/app/theme/colors.dart';
import 'package:partyguam/app/widgets/app_bar.dart';
import 'package:partyguam/app/widgets/text.dart';

import '../../../widgets/buttons.dart';
import '../widgets/buttons.dart';
import '../widgets/steppers.dart';

class SignUpDetail0122 extends StatefulWidget {
  const SignUpDetail0122({super.key});

  @override
  State<SignUpDetail0122> createState() => _SignUpDetail0122State();
}

class _SignUpDetail0122State extends State<SignUpDetail0122> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SignInAppBar(title: '세부프로필'),
      body: Column(
        children: [
          const SignUpDetailsStepper(
            currentStep: 1,
            stage: '성향선택(1/4)',
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTitleText(
                  '***님의\n경력과 포지션을 입력해 주세요.',
                  '경력과 포지션을 입력하고 파티를 추천 받으세요.',
                ),
                _buildPositionButton('주포지션'),
                const SizedBox(
                  height: 40.0,
                ),
                _buildPositionButton('부포지션'),
              ],
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: buildFilledLongButton(
              context,
              '다음',
              '/sign_up/detail/0124',
            ),
          ),
          buildSkipButton(
            context,
            '/sign_up/detail/0123',
          ),
        ],
      ),
    );
  }

  Widget _buildPositionButton(String name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            color: AppColors.greyColors.shade700,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            height: 1.4,
            letterSpacing: -0.25,
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(16.0),
          child: Material(
            elevation: 1.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
              side: BorderSide(color: AppColors.greyColors.shade200),
            ),
            child: Container(
              height: 48.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.greyColors.shade50,
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(
                  color: AppColors.greyColors.shade200,
                ),
              ),
              child: Center(
                child: Text(
                  '+ 추가하기',
                  style: TextStyle(
                    color: AppColors.greyColors.shade500,
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                    height: 1.4,
                    letterSpacing: -0.25,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
