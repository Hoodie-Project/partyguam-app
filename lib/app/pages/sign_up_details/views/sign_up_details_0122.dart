import 'package:flutter/material.dart';
import 'package:partyguam/app/widgets/app_bar.dart';
import 'package:partyguam/app/widgets/buttons.dart';

class SignUpDetail0122 extends StatefulWidget {
  const SignUpDetail0122({super.key});

  @override
  State<SignUpDetail0122> createState() => _SignUpDetail0122State();
}

class _SignUpDetail0122State extends State<SignUpDetail0122> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SignInAppBar(title: '세부프로필'),
      body: buildFilledLongButton(
        context,
        '다음',
        '/sign_up/detail/0124',
      ),
    );
  }
}
