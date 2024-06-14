import 'package:flutter/material.dart';

import '../../routes/route_path.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/buttons.dart';

class Main1100 extends StatelessWidget {
  const Main1100({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SignInAppBar(title: '메인'),
      body: Column(
        children: [
          const Text('메인 페이지에 오신걸 환영합니다!'),
          buildFilledLongButton(
            context,
            '회원가입 페이지',
            RouterPath.signUp,
          ),
          buildFilledLongButton(
            context,
            '세부 프로필 페이지',
            '${RouterPath.signUp}/detail/0122',
          ),
          const SizedBox(height: 20),
          buildFilledLongButton(
            context,
            '파티 지원 페이지',
            '${RouterPath.party}/1150',
          ),
        ],
      ),
    );
  }
}
