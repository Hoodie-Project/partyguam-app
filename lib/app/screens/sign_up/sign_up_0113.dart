import 'package:flutter/material.dart';

import 'widgets/app_bar.dart';
import 'widgets/buttons.dart';
import 'widgets/components.dart';
import 'widgets/text.dart';

class SignUp0113 extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SignUp0113({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SignUpAppBar(
        title: '가입하기',
        route: '/sign_up/0114',
        pageCount: '3/4',
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            left: 20.0, top: 40.0, right: 20.0, bottom: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleText(
                mainTitle: '***님의\n생년월일을 알려주세요.',
                subTitle: '프로필에서 노출 여부를 설정할 수 있어요.'),
            NickNameForm(
              hintText: '8자리를 입력해 주세요. (ex. 1990-12-31)',
            ),
            const Expanded(
              child: SizedBox(),
            ),
            MainHorizontalButton(
              key: formKey,
              content: '다음',
              route: '/sign_up/0114',
            )
          ],
        ),
      ),
    );
  }
}
