import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/usecases/user_usecase.dart';
import '../../../../domain/usecases/validation.dart';
import '../../../theme/colors.dart';

/// Login0000
class SocialLoginButton extends StatefulWidget {
  final String text;
  final Widget icon;
  final Color backgroundColor;

  const SocialLoginButton({
    super.key,
    required this.text,
    required this.icon,
    required this.backgroundColor,
  });

  @override
  State<SocialLoginButton> createState() => _SocialLoginButtonState();
}

class _SocialLoginButtonState extends State<SocialLoginButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () async {
          if (widget.text == '카카오톡 로그인') {
            await signInWithKakao(context);
          } else if (widget.text == '구글 로그인') {
            context.push('/sign_up/0111');
          }
        },
        style: ElevatedButton.styleFrom(
          alignment: Alignment.centerLeft,
          backgroundColor: widget.backgroundColor,
          elevation: 1,
          foregroundColor: AppColors.greyColors.shade700,
          padding: const EdgeInsets.only(
            left: 20.0,
          ),
          minimumSize: const Size(
            335.0,
            52.0,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          textStyle: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        icon: widget.icon,
        label: Text(widget.text),
      ),
    );
  }
}

class TermText extends StatelessWidget {
  const TermText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '소셜 로그인 가입 시 ',
        style: TextStyle(
          color: AppColors.greyColors.shade700,
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
        ),
        children: const [
          TextSpan(
            text: '이용약관 개인정보처리방침 전자금융거래약관 \n결제/환불약관',
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.underline,
            ),
          ),
          TextSpan(text: '에 동의한 것으로 간주합니다.')
        ],
      ),
    );
  }
}

class SignUpTextButton extends StatelessWidget {
  const SignUpTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            '회원가입',
            style: TextStyle(
              color: AppColors.greyColors.shade500,
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Text(
          ' | ',
          style: TextStyle(
            color: AppColors.greyColors.shade200,
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            '문의하기',
            style: TextStyle(
              color: AppColors.greyColors.shade500,
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}

/// TODO: 코드 중복 존재, 우선 구현 후 삭제 (SignUp0111)
class EmailConfirmForm extends StatefulWidget {
  const EmailConfirmForm({super.key});

  @override
  State<EmailConfirmForm> createState() => _EmailConfirmFormState();
}

class _EmailConfirmFormState extends State<EmailConfirmForm> {
  String? email;

  @override
  void initState() {
    super.initState();
    _getUserEmail();
  }

  void _getUserEmail() async {
    try {
      String? userEmail = await getKakaoUserInfo();
      print(userEmail);

      setState(() {
        email = userEmail;
      });
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Material(
        color: AppColors.greyColors.shade50,
        elevation: 1.0,
        borderRadius: const BorderRadius.all(
          Radius.circular(16.0),
        ),
        child: Container(
          height: 52.0,
          padding: const EdgeInsets.only(left: 20.0, top: 15.0, bottom: 15.0),
          decoration: BoxDecoration(
            color: AppColors.greyColors.shade100,
            borderRadius: const BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          child: email != null
              ? Text(
                  '$email',
                  style: TextStyle(
                    color: AppColors.greyColors.shade500,
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
                )
              : Text(''),
        ),
      ),
    );
  }
}

/// TODO: 코드 중복 존재, 우선 구현 후 삭제 (SignUp0112)
class NickNameForm extends StatefulWidget {
  final String hintText;

// final FormFieldValidator validator;

  const NickNameForm({
    super.key,
    required this.hintText,
  });

  @override
  State<NickNameForm> createState() => _NickNameFormState();
}

class _NickNameFormState extends State<NickNameForm> {
  final textController = TextEditingController();
  bool _showClearIcon = false;

  @override
  void initState() {
    super.initState();

    textController.addListener(_updateClearIconVisibility);
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        autofocus: true,
        controller: textController,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.only(left: 20.0, top: 15.0, bottom: 15.0),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: AppColors.greyColors.shade400,
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
          ),
          suffixIcon: _showClearIcon
              ? IconButton(
                  // TODO: CustomIcons 설정
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

          /// TODO: 에러메세지 인풋창과 정렬 맞춰야 함
          errorStyle: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 12.0,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.greyColors.shade200,
              width: 1.0,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryLightColors,
              width: 1.0,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.systemColors.shade100,
              width: 1.0,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.systemColors.shade100,
              width: 1.0,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
        ),
        validator: (value) {
          return nicknameValidation(value);
        },
      ),
    );
  }
}
