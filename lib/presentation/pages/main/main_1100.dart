import 'package:flutter/material.dart';

import '../../routes/route_path.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/buttons.dart';

class Main1100 extends StatelessWidget {
  const Main1100({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SignInAppBar(title: '메인'),
      body: Column(
        children: [
          Text('메인 페이지에 오신걸 환영합니다!'),
          buildFilledLongButton(
            context,
            '회원가입 페이지',
            RouterPath.signUp,
          ),
        ],
      ),
    );
  }
}
