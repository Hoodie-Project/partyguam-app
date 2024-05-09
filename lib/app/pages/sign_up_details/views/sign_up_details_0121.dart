import 'package:flutter/material.dart';

import '../../../theme/colors.dart';
import '../../../theme/styles.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/text.dart';
import '../widgets/buttons.dart';
import '../widgets/steppers.dart';

class SignUpDetail0121 extends StatefulWidget {
  const SignUpDetail0121({super.key});

  @override
  State<SignUpDetail0121> createState() => _SignUpDetail0121State();
}

class _SignUpDetail0121State extends State<SignUpDetail0121> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SignInAppBar(title: '세부프로필'),
      body: Column(
        children: [
          const SignUpDetailsStepper(
            currentStep: 0,
            stage: '성향선택(1/4)',
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTitleText(
                  '관심 지역을 선택하고\n파티를 추천 받아보세요!',
                  '거주 지역이나 자주 찾는 지역을 선택해주세요. (최대 3곳)',
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: _buildListView(),
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Expanded(
                      flex: 2,
                      child: _buildListView(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // 그림자 색상과 투명도
                  spreadRadius: 5, // 그림자가 퍼지는 범위
                  blurRadius: 7, // 그림자의 흐림 정도
                  offset: const Offset(0, 3), // 그림자가 떨어지는 방향
                ),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
                  child: _buildNextButton(context),
                ),
                buildSkipButton(
                  context,
                  '/sign_up/detail/0123',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListView() {
    return SingleChildScrollView(
      child: Container(
        height: 312.0,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.greyColors.shade200),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return _buildListTiles(index);
          },
          // separatorBuilder: (BuildContext context, int index) {
          //   return Container();
          // },
          itemCount: 10,
        ),
      ),
    );
  }

  Widget _buildListTiles(int index) {
    return Container(
      height: 52.0,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: Colors.transparent),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          '서울',
          style: TextStyle(
            color: AppColors.greyColors.shade400,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _buildNextButton(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Material(
          color: AppColors.greyColors.shade50,
          elevation: 1.0,
          borderRadius: const BorderRadius.all(
            Radius.circular(16.0),
          ),
          child: ElevatedButton(
            onPressed: () {},
            style: CommonButtonStyles.filledLongStyle,
            child: const Text('다음'),
          ),
        ),
      ),
    );
  }
}
