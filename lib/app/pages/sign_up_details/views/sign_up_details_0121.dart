import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
  void _navigateToNextPage() {
    context.push('/sign_up/detail/0122');
  }

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
                      child: _buildProvinceListView(),
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Expanded(
                      flex: 2,
                      child: _buildCityListTiles(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
            child: _buildNextButton(context),
          ),
          buildSkipButton(
            context,
            '/sign_up/detail/0123',
          ),
        ],
      ),
    );
  }

  Widget _buildProvinceListView() {
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
          itemCount: 10,
        ),
      ),
    );
  }

  Widget _buildListTiles(int index) {
    return Container(
      height: 52.0,
      decoration: BoxDecoration(
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

  _buildCityListTiles() {
    return SizedBox(
      child: Container(
        height: 312.0,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.greyColors.shade200),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2열로 설정
            childAspectRatio: 2.3, // 각 그리드 항목의 가로 세로 비율을 1.0으로 설정
          ),
          itemCount: 20, // 그리드 아이템의 총 개수
          itemBuilder: (BuildContext context, int index) {
            return GridTile(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(color: Colors.transparent),
                ),
                child: Center(
                  child: Text(
                    '전체',
                    style: TextStyle(
                      color: AppColors.greyColors.shade600,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );

    // return Container(
    //   height: 52.0,
    //   decoration: BoxDecoration(
    //     color: Colors.transparent,
    //     borderRadius: BorderRadius.circular(16.0),
    //     border: Border.all(color: Colors.transparent),
    //   ),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
    //     children: [
    //       Text(
    //         '전체',
    //         style: TextStyle(
    //           color: AppColors.greyColors.shade600,
    //           fontSize: 14.0,
    //           fontWeight: FontWeight.normal,
    //         ),
    //       ),
    //       Text(
    //         '강남구',
    //         style: TextStyle(
    //           color: AppColors.greyColors.shade600,
    //           fontSize: 14.0,
    //           fontWeight: FontWeight.normal,
    //         ),
    //       ),
    //     ],
    //   ),
    // );
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
          onPressed: () {
            _navigateToNextPage();
          },
          style: CommonButtonStyles.filledLongStyle,
          child: const Text('다음'),
        ),
      ),
    );
  }
}
