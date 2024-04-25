import 'package:flutter/material.dart';

import 'widgets/app_bar.dart';
import 'widgets/buttons.dart';
import 'widgets/text.dart';

class SignUp0114 extends StatelessWidget {
  const SignUp0114({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SignUpAppBar(
        title: '가입하기',
        route: '/sign_up/0115',
        pageCount: '4/4',
      ),
      body: Padding(
        padding:
            EdgeInsets.only(left: 20.0, top: 40.0, right: 20.0, bottom: 12.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleText(
                mainTitle: '성별은\n어떻게 되시나요?',
                subTitle: '프로필에서 노출 여부를 설정할 수 있어요.',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SquareButton(content: '남자'),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: SquareButton(content: '여자'),
                  ),
                ],
              ),
              Expanded(
                child: SizedBox(),
              ),
              MainHorizontalButton(
                content: '다음',
                route: '/sign_up/0115',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
