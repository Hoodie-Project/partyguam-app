import 'package:flutter/material.dart';

import '../../../widgets/app_bar.dart';
import '../widgets/steppers.dart';

class SignUpDetail0127 extends StatefulWidget {
  const SignUpDetail0127({super.key});

  @override
  State<SignUpDetail0127> createState() => _SignUpDetail0127State();
}

class _SignUpDetail0127State extends State<SignUpDetail0127> {
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
