import 'package:flutter/material.dart';

import 'widgets/app_bar.dart';
import 'widgets/buttons.dart';
import 'widgets/text.dart';

class SignUp0114 extends StatelessWidget {
  const SignUp0114({super.key});

  @override
  State<SignUp0114> createState() => _SignUp0114State();
}

class _SignUp0114State extends State<SignUp0114> {
  Color _containerColor1 = AppColors.greyColors.shade50;
  Color _containerColor2 = AppColors.greyColors.shade50;
  final Color _tappedColor = AppColors.primaryLightColors.shade300;

  Color _borderColor1 = AppColors.greyColors.shade200;
  Color _borderColor2 = AppColors.greyColors.shade200;
  final Color _tappedBorderColor = AppColors.primaryLightColors.shade100;

  void _changeColor1() {
    setState(() {
      _containerColor1 =
          _containerColor1 == _tappedColor ? _containerColor1 : _tappedColor;
      _containerColor2 = AppColors.greyColors.shade50;
      _borderColor1 = _borderColor1 == _tappedBorderColor
          ? _borderColor2
          : _tappedBorderColor;
      _borderColor2 = AppColors.greyColors.shade200;
    });
  }

  void _changeColor2() {
    setState(() {
      _containerColor2 =
          _containerColor2 == _tappedColor ? _containerColor2 : _tappedColor;
      _containerColor1 = AppColors.greyColors.shade50;
      _borderColor2 = _borderColor2 == _tappedBorderColor
          ? _borderColor1
          : _tappedBorderColor;
      _borderColor1 = AppColors.greyColors.shade200;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SignUpAppBar(
        title: '가입하기',
        route: '/sign_up/0115',
        pageCount: '4/4',
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            left: 20.0, top: 40.0, right: 20.0, bottom: 12.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleText(
                mainTitle: '성별은\n어떻게 되시나요?',
                subTitle: '프로필에서 노출 여부를 설정할 수 있어요.',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _changeColor1();
                      },
                      child: SquareButton(
                        borderColor: _borderColor1,
                        content: '남자',
                        containerColor: _containerColor1,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _changeColor2();
                      },
                      child: SquareButton(
                        borderColor: _borderColor2,
                        content: '여자',
                        containerColor: _containerColor2,
                      ),
                    ),
                  ),
                ],
              ),
              const Expanded(
                child: SizedBox(),
              ),
              const MainHorizontalButton(
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
