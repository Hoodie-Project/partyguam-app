import 'package:flutter/material.dart';

import '../../../../domain/usecases/user_usecase.dart';
import '../../../theme/colors.dart';
import '../widgets/app_bar.dart';
import '../widgets/buttons.dart';
import '../widgets/text.dart';

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
        route: '/sign_up/0112',
        pageCount: '1/4',
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            left: 20.0, top: 40.0, right: 20.0, bottom: 12.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleText(
                mainTitle: '가입을 축하드려요!\n이메일 정보가 맞나요?',
                subTitle: '나중에 변경할 수 없어요.',
              ),
              _emailConfirmForm(email),
              const Expanded(
                child: SizedBox(),
              ),
              const MainHorizontalButton(
                content: '네, 맞아요',
                route: '/sign_up/0112',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emailConfirmForm(String? email) {
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
                  email,
                  style: TextStyle(
                    color: AppColors.greyColors.shade500,
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
                )
              : const Text(''),
        ),
      ),
    );
  }
}
