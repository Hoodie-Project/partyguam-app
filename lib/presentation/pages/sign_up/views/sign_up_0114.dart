import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/index.dart';
import '../../../routes/route_path.dart';
import '../../../theme/colors.dart';
import '../../../theme/styles.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/text.dart';
import '../cubit/user_form_cubit.dart';
import 'styles.dart';

class SignUp0114 extends StatefulWidget {
  const SignUp0114({super.key});

  @override
  State<SignUp0114> createState() => _SignUp0114State();
}

class _SignUp0114State extends State<SignUp0114> {
  bool _isButtonEnabled = false;

  List<String> genderList =
      Gender.values.map((element) => element.gender).toList();

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
    if (_containerColor1 == _tappedColor) {
      setState(() {
        _isButtonEnabled = true;
        context.read<UserFormCubit>().setGender('M');
      });
    } else if (_containerColor2 == _tappedColor) {
      _isButtonEnabled = true;
      context.read<UserFormCubit>().setGender('F');
    }
  }

  void _navigateToNextPage() {
    context.push('${RouterPath.signUp}/0115');
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
              buildTitleText(
                '성별은\n어떻게 되시나요?',
                '프로필에서 노출 여부를 설정할 수 있어요.',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _buildSquareButton(
                      _changeColor1,
                      _containerColor1,
                      _borderColor1,
                      genderList[0],
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: _buildSquareButton(
                      _changeColor2,
                      _containerColor2,
                      _borderColor2,
                      genderList[1],
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
    VoidCallback changeColor,
    Color containerColor,
    Color borderColor,
    String text,
  ) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: changeColor,
      child: Material(
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
              text,
              style: SignUp0114Styles.squareButtonText,
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
          style: CommonButtonStyles.filledLongStyle,
          child: const Text('다음'),
        ),
      ),
    );
  }
}
