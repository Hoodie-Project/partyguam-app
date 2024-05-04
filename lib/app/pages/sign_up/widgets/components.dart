import 'package:flutter/material.dart';

import '../../../../domain/usecases/user_usecase.dart';
import '../../../../domain/usecases/validation.dart';
import '../../../theme/colors.dart';

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
