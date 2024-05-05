import 'package:flutter/material.dart';
import 'package:partyguam/app/widgets/buttons.dart';

import '../../../../domain/usecases/user_usecase.dart';
import '../../../theme/colors.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/text.dart';
import 'styles.dart';

class SignUp0111 extends StatefulWidget {
  const SignUp0111({super.key});

  @override
  State<SignUp0111> createState() => _SignUp0111State();
}

class _SignUp0111State extends State<SignUp0111> {
  String? email;

  Future<void> getUserEmail() async {
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
  void initState() {
    super.initState();

    getUserEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DialogAppBar(
        title: '가입하기',
        pageCount: '1/4',
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            left: 20.0, top: 40.0, right: 20.0, bottom: 12.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTitleText(
                '가입을 축하드려요!\n이메일 정보가 맞나요?',
                '나중에 변경할 수 없어요.',
              ),
              _buildEmailConfirmForm(email),
              const Expanded(
                child: SizedBox(),
              ),
              buildFilledLongButton(
                context,
                '네, 맞아요',
                '/sign_up/0112',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailConfirmForm(String? email) {
    return SizedBox(
      width: double.infinity,
      child: Material(
        color: AppColors.greyColors.shade50,
        elevation: 1.0,
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        child: Container(
          height: 52.0,
          padding: const EdgeInsets.only(left: 20.0, top: 15.0, bottom: 15.0),
          decoration: BoxDecoration(
            color: AppColors.greyColors.shade100,
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          ),
          child: email != null
              ? Text(
                  email,
                  style: SignUp0111Styles.emailText,
                )
              : const Text(''),
        ),
      ),
    );
  }
}
