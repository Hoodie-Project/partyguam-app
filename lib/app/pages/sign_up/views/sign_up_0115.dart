import 'package:flutter/material.dart';

import '../../../theme/font_styles.dart';
import '../widgets/app_bar.dart';
import '../widgets/buttons.dart';

class SignUp0115 extends StatelessWidget {
  const SignUp0115({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: NoIconsAppBar(title: '가입완료'),
      body: Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Center(
              child: Text(
                textAlign: TextAlign.center,
                '가입을 축하합니다!\n세부 프로필을 작성해 볼까요?',
                style: CustomFontStyle.loginMainTitle,
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: OutlinedShortButton(
                    content: '홈으로 이동',
                    route: '/',
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: FilledShortButton(
                    content: '작성하기',
                    route: '/sign_up/detail/0121',
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
