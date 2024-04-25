import 'package:flutter/material.dart';

import 'widgets/app_bar.dart';
import 'widgets/buttons.dart';
import 'widgets/components.dart';
import 'widgets/text.dart';

class SignUp0111 extends StatelessWidget {
  const SignUp0111({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SignUpAppBar(
        title: '가입하기',
        route: '/sign_up/0112',
        pageCount: '1/4',
      ),
      body: Padding(
        padding:
            EdgeInsets.only(left: 20.0, top: 40.0, right: 20.0, bottom: 12.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleText(
                mainTitle: '가입을 축하드려요!\n이메일 정보가 맞나요?',
                subTitle: '나중에 변경할 수 없어요.',
              ),
              // TODO: SSO 구현 후 email 값 변경 필요
              EmailConfirmForm(),
              Expanded(
                child: SizedBox(),
              ),
              MainHorizontalButton(
                content: '네, 맞아요',
                route: '/sign_up/0112',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
