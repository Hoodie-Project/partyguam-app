import 'package:flutter/material.dart';

import '../../../widgets/app_bar.dart';
import '../../../widgets/buttons.dart';
import 'styles.dart';

class SignUp0115 extends StatelessWidget {
  const SignUp0115({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NoIconsAppBar(title: '가입완료'),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Center(
              child: Text(
                textAlign: TextAlign.center,
                '가입을 축하합니다!\n세부 프로필을 작성해 볼까요?',
                style: SignUp0115Styles.mainTitle,
              ),
            ),
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: buildOutlinedShortButton(
                    context,
                    '홈으로 이동',
                    '/',
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: buildFilledLongButton(
                    context,
                    '작성하기',
                    '/sign_up/detail/0121',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
