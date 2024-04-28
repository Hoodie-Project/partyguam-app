import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:partyguam/app/pages/sign_up/widgets/text.dart';
import 'package:partyguam/app/theme/colors.dart';

import '../../sign_up/widgets/app_bar.dart';
import '../../sign_up/widgets/buttons.dart';
import '../widgets/steppers.dart';

class SignUpDetail0123 extends StatefulWidget {
  const SignUpDetail0123({super.key});

  @override
  State<SignUpDetail0123> createState() => _SignUpDetail0121State();
}

class _SignUpDetail0121State extends State<SignUpDetail0123> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LoginAppBar(title: '세부프로필'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SignUpDetailsStepper(),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleText(
                  mainTitle: '주로 작업하는 시간대는\n어떻게 되시나요?',
                  subTitle: '비슷한 성향의 파티원을 추천해 드려요. (최대 2개)',
                ),
                _timeListView(),
              ],
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: MainHorizontalButton(
                content: '다음', route: '/sign_up/detail/0124'),
          ),
          // SignUpDetailNextButton(context),
          Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 20.0),
            child: Center(
              child: TextButton(
                onPressed: () {
                  context.push('/sign_up/detail/0124');
                },
                child: Text(
                  '건너뛰기',
                  style: TextStyle(
                    color: AppColors.greyColors.shade500,
                    decoration: TextDecoration.underline,
                    fontSize: 12.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _timeListView() {
    return SizedBox(
      height: 350,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return _timeListTile();
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 8.0,
          );
        },
        itemCount: 5,
      ),
    );
  }

  Widget _timeListTile() {
    return Material(
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: BorderSide(color: AppColors.greyColors.shade200),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 20),
        title: const Text('오전 (6시 ~ 12시)'),
        titleTextStyle: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
          color: AppColors.greyColors.shade700,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: BorderSide(color: AppColors.greyColors.shade200),
        ),
        leading: const Icon(Icons.check_circle_outline_rounded),
        tileColor: AppColors.greyColors.shade50,
        iconColor: AppColors.greyColors.shade200,
      ),
    );
  }
}

// SignUpDetailNextButton(BuildContext context) {
//   final currentStep =
//   return SizedBox(
//     width: double.infinity,
//     child: Material(
//       color: AppColors.greyColors.shade50,
//       elevation: 1.0,
//       borderRadius: const BorderRadius.all(
//         Radius.circular(16.0),
//       ),
//       child: ElevatedButton(
//         onPressed: () {
//           context.push('sign_up/detail/0124');
//         },
//         style: ButtonStyles.filledLongStyle,
//         child: Text('다음'),
//       ),
//     ),
//   );
// }
