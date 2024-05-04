import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../theme/colors.dart';
import '../widgets/app_bar.dart';
import '../widgets/styles.dart';
import '../widgets/text.dart';

class SignUp0114 extends StatefulWidget {
  const SignUp0114({super.key});

  @override
  State<SignUp0114> createState() => _SignUp0114State();
}

class _SignUp0114State extends State<SignUp0114> {
  bool _isButtonEnabled = false;

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
      _checkButtonState();
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

    _checkButtonState();
  }

  void _checkButtonState() {
    if (_containerColor1 == _tappedColor || _containerColor2 == _tappedColor) {
      setState(() {
        _isButtonEnabled = true;
      });
    }
  }

  void _navigateToNextPage() {
    context.push('/sign_up/0115');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SignUpAppBar(
        title: '가입하기',
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
                      child: _buildSquareButton(
                        _containerColor1,
                        _borderColor1,
                        '남자',
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
                      child: _buildSquareButton(
                        _containerColor2,
                        _borderColor2,
                        '여자',
                      ),
                    ),
                  ),
                ],
              ),
              const Expanded(
                child: SizedBox(),
              ),
              _buildNextButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSquareButton(
      Color containerColor, Color borderColor, String content) {
    return Material(
      color: containerColor,
      elevation: 1.0,
      borderRadius: const BorderRadius.all(
        Radius.circular(16.0),
      ),
      child: Container(
        height: 163.0,
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
            width: 1.0,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        child: Center(
          child: Text(
            content,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNextButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Material(
        color: AppColors.greyColors.shade50,
        elevation: 1.0,
        borderRadius: const BorderRadius.all(
          Radius.circular(16.0),
        ),
        child: ElevatedButton(
          onPressed: _isButtonEnabled ? _navigateToNextPage : null,
          style: ButtonStyles.filledLongStyle,
          child: const Text('다음'),
        ),
      ),
    );
  }
}
