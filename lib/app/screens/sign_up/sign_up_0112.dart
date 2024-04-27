import 'package:flutter/material.dart';

import '../../../domain/usecases/validation.dart';
import '../../theme/colors.dart';
import 'widgets/app_bar.dart';
import 'widgets/styles.dart';
import 'widgets/text.dart';

class SignUp0112 extends StatefulWidget {
  SignUp0112({super.key});

  @override
  State<SignUp0112> createState() => _SignUp0112State();
}

class _SignUp0112State extends State<SignUp0112> {
  bool _showClearIcon = false;
  bool _isButtonDisabled = true;
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    textController.addListener(_updateClearIconVisibility);
    textController.addListener(_isTextFormEmpty);
  }

  @override
  void dispose() {
    textController.removeListener(_updateClearIconVisibility);
    textController.dispose();
    super.dispose();
  }

  void _updateClearIconVisibility() {
    setState(() {
      _showClearIcon = textController.text.isNotEmpty;
    });
  }

  void _clearText() {
    setState(() {
      textController.clear();
    });
  }

  void _isTextFormEmpty() {
    setState(() {
      _isButtonDisabled = textController.text.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SignUpAppBar(
        title: '가입하기',
        route: '/sign_up/0113',
        pageCount: '2/4',
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            left: 20.0, top: 40.0, right: 20.0, bottom: 12.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleText(
                mainTitle: '어떻게 불러드리면 될까요?\n닉네임을 입력해 주세요',
                subTitle: '닉네임은 나중에 변경할 수 없어요.',
              ),
              _nickNameForm(),
              const Expanded(
                child: SizedBox(),
              ),
              _button(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _nickNameForm() {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        autofocus: true,
        controller: textController,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.only(left: 20.0, top: 15.0, bottom: 15.0),
          hintText: '15자 이내로 입력해 주세요. (영문/숫자/한글)',
          hintStyle: TextStyle(
            color: AppColors.greyColors.shade400,
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
          ),
          suffixIcon: _showClearIcon
              ? IconButton(
                  icon: Icon(
                    Icons.cancel_outlined,
                    color: AppColors.greyColors.shade700,
                    size: 20.0,
                  ),
                  onPressed: () {
                    setState(() {
                      _clearText();
                    });
                  },
                )
              : null,
          errorStyle: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 12.0,
          ),
          enabledBorder: TextFormBorderStyles.enabledBorder,
          focusedBorder: TextFormBorderStyles.focusedBorder,
          errorBorder: TextFormBorderStyles.errorBorder,
          focusedErrorBorder: TextFormBorderStyles.focusedErrorBorder,
        ),
        validator: (value) {
          return nicknameValidation(value);
        },
      ),
    );
  }

  Widget _button(context) {
    return SizedBox(
      width: double.infinity,
      child: Material(
        color: AppColors.greyColors.shade50,
        elevation: 1.0,
        borderRadius: const BorderRadius.all(
          Radius.circular(16.0),
        ),
        child: ElevatedButton(
          onPressed: _isButtonDisabled
              ? null
              : () {
                  context.push('/sign_up/0113');
                },
          style: ButtonStyles.filledLongStyle,
          child: Text('다음'),
        ),
      ),
    );
  }
}
