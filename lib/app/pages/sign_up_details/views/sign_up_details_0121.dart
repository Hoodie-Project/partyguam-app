import 'package:flutter/material.dart';
import 'package:partyguam/app/widgets/buttons.dart';

import '../../../widgets/app_bar.dart';
import '../widgets/steppers.dart';

class SignUpDetail0121 extends StatefulWidget {
  const SignUpDetail0121({super.key});

  @override
  State<SignUpDetail0121> createState() => _SignUpDetail0121State();
}

class _SignUpDetail0121State extends State<SignUpDetail0121> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SignInAppBar(title: '세부프로필'),
      body: Column(
        children: [
          const SignUpDetailsStepper(
            currentStep: 0,
            stage: '성향선택(1/4)',
          ),
          buildFilledLongButton(
            context,
            '다음',
            '/sign_up/detail/0123',
          ),
        ],
      ),
    );
  }
}
