import 'package:flutter/material.dart';
import 'package:partyguam/app/screens/sign_up/widgets/app_bar.dart';
import 'package:partyguam/app/screens/sign_up/widgets/buttons.dart';
import 'package:partyguam/app/screens/sign_up/widgets/form.dart';
import 'package:partyguam/app/screens/sign_up/widgets/text.dart';

class SignUp0113 extends StatelessWidget {
  const SignUp0113({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SignUpAppBar(title: '가입하기', pageCount: '3/4'),
      body: Padding(
        padding:
            EdgeInsets.only(left: 20.0, top: 40.0, right: 20.0, bottom: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleText(
                mainTitle: '***님의\n생년월일을 알려주세요',
                subTitle: '프로필에서 노출여부를 설정 할 수 있어요'),
            InputFormField(
              hintText: '8자리를 입력해주세요. (ex. 19901231)',
            ),
            Expanded(
              child: SizedBox(),
            ),
            MainHorizontalButton(content: '다음', routeName: '/sign_up/0114')
          ],
        ),
      ),
    );
  }
}
