import 'package:flutter/material.dart';

import '../../../widgets/app_bar.dart';
import '../widgets/steppers.dart';

class SignUpDetail0125 extends StatefulWidget {
  const SignUpDetail0125({super.key});

  @override
  State<SignUpDetail0125> createState() => _SignUpDetail0125State();
}

class _SignUpDetail0125State extends State<SignUpDetail0125> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: const SignInAppBar(title: '세부프로필'),
      body: Column(
        children: [
          const SignUpDetailsStepper(
            currentStep: 2,
            stage: '성향선택(3/4)',
          ),
        ],
      ),
    );
  }
}
