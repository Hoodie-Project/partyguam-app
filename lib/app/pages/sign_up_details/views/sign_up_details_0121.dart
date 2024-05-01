import 'package:flutter/material.dart';

import '../../sign_up/widgets/app_bar.dart';
import '../../sign_up/widgets/buttons.dart';
import '../widgets/steppers.dart';

class SignUpDetail0121 extends StatefulWidget {
  const SignUpDetail0121({super.key});

  @override
  State<SignUpDetail0121> createState() => _SignUpDetail0121State();
}

class _SignUpDetail0121State extends State<SignUpDetail0121> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: LoginAppBar(title: '세부프로필'),
      body: Column(
        children: [
          SignUpDetailsStepper(currentStep: 0),
          MainHorizontalButton(
            content: '다음',
            route: '/sign_up/detail/0123',
          )
        ],
      ),
    );
  }
}
