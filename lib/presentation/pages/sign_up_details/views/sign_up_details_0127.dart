import 'package:flutter/material.dart';

import '../../../routes/route_path.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/buttons.dart';
import '../../sign_up/views/styles.dart';

class SignUpDetail0127 extends StatefulWidget {
  const SignUpDetail0127({super.key});

  @override
  State<SignUpDetail0127> createState() => _SignUpDetail0127State();
}

class _SignUpDetail0127State extends State<SignUpDetail0127> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ExitIconAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Center(
              child: Text(
                textAlign: TextAlign.center,
                '세부 프로필 입력이 완료되었어요!\n파티에 참여해볼까요?',
                style: SignUp0115Styles.mainTitle,
              ),
            ),
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: buildOutlinedShortButton(
                    context,
                    '프로필로 이동',
                    '/',
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: buildFilledLongButton(
                    context,
                    '확인',
                    RouterPath.main,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
