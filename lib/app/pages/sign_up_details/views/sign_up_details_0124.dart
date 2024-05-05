import 'package:flutter/material.dart';
import 'package:partyguam/app/widgets/buttons.dart';

import '../../../widgets/app_bar.dart';
import '../widgets/steppers.dart';

class SignUpDetail0124 extends StatefulWidget {
  const SignUpDetail0124({super.key});

  @override
  State<SignUpDetail0124> createState() => _SignUpDetail0121State();
}

class _SignUpDetail0121State extends State<SignUpDetail0124> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SignInAppBar(title: '세부프로필'),
      body: Column(
        children: [
          const SignUpDetailsStepper(currentStep: 2),
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
