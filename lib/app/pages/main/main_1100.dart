import 'package:flutter/material.dart';
import 'package:partyguam/app/widgets/app_bar.dart';

class Main1100 extends StatelessWidget {
  const Main1100({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SignInAppBar(title: '메인'),
      body: Column(
        children: [
          Text('메인 페이지에 오신걸 환영합니다!'),
        ],
      ),
    );
  }
}
