import 'package:flutter/material.dart';

import '../../sign_up/widgets/app_bar.dart';
import '../../sign_up/widgets/buttons.dart';
import '../widgets/steppers.dart';

class SignUpDetail0124 extends StatefulWidget {
  const SignUpDetail0124({super.key});

  @override
  State<SignUpDetail0124> createState() => _SignUpDetail0121State();
}

class _SignUpDetail0121State extends State<SignUpDetail0124> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: LoginAppBar(title: '세부프로필'),
      body: Column(
        children: [
          SignUpDetailsStepper(currentStep: 2),
          MainHorizontalButton(
            content: '다음',
            route: '/sign_up/detail/0123',
          )
        ],
      ),
    );
  }
}
