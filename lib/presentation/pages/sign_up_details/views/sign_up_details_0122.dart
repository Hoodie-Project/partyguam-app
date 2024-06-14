import 'package:flutter/material.dart';

import '../../../widgets/app_bar.dart';
import '../../../widgets/buttons.dart';

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
      body: buildFilledLongButton(
        context,
        '다음',
        '/sign_up/detail/0124',
      ),
    );
  }
}
