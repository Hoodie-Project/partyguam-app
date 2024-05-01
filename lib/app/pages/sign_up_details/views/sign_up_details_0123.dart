import 'package:flutter/material.dart';

import '../../../theme/colors.dart';
import '../../../utils/constants.dart';
import '../../sign_up/widgets/app_bar.dart';
import '../../sign_up/widgets/buttons.dart';
import '../../sign_up/widgets/text.dart';
import '../widgets/buttons.dart';
import '../widgets/steppers.dart';
import 'styles.dart';

class SignUpDetail0123 extends StatefulWidget {
  const SignUpDetail0123({super.key});

  @override
  State<SignUpDetail0123> createState() => _SignUpDetail0121State();
}

class _SignUpDetail0121State extends State<SignUpDetail0123> {
  final List<int> selectedItems = [];
  final timeLabelList = Time.values.map((element) => element.label).toList();
  final timeHoursList = Time.values.map((element) => element.hours).toList();

  void _selectItem(int index) {
    setState(() {
      // 빈 배열 인경우 (아무 것도 선택 안 했을 때)
      if (selectedItems.isEmpty) {
        selectedItems.add(index); // 그냥 추가
        // 요소가 하나 있는 경우 (한 개 선택 했을 때)
      } else if (selectedItems.length == 1) {
        if (selectedItems.contains(index)) {
          selectedItems.remove(index);
        } else {
          selectedItems.add(index);
        }
        // 요소가 두개 있는 경우 (모두 선택 했을 때)
      } else if (selectedItems.length == 2) {
        if (selectedItems.contains(index)) {
          selectedItems.remove(index);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LoginAppBar(title: '세부프로필'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SignUpDetailsStepper(currentStep: 2),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
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
              content: '다음',
              route: '/sign_up/detail/0124',
            ),
          ),
          const SkipButton(route: '/sign_up/detail/0124'),
        ],
      ),
    );
  }

  Widget _timeListView() {
    return SizedBox(
      height: 350.0,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return _timeListTile(index);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 8.0);
        },
        itemCount: timeLabelList.length,
      ),
    );
  }

  Widget _timeListTile(int index) {
    final timeLabel = timeLabelList[index];
    final timeHours = timeHoursList[index];
    final bool isSelected = selectedItems.contains(index);

    return Material(
      elevation: 1.0,
      shape: isSelected
          ? CustomBorderStyle.selectedBorderStyle
          : CustomBorderStyle.unselectedBorderStyle,
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 20),
        title: Text('$timeLabel $timeHours'),
        titleTextStyle: isSelected
            ? SignUpDetailsTextStyle.selectedTextStyle
            : SignUpDetailsTextStyle.unselectedTextStyle,
        // 클릭한 타일 (타일 5개 중에 무엇이 selected 됐는지 확인)
        selected: isSelected,
        onTap: () {
          setState(() {
            _selectItem(index);
          });
        },
        leading: isSelected
            ? const Icon(Icons.check_circle_rounded)
            : const Icon(Icons.check_circle_outline_rounded),
        iconColor: SignUpDetailsColorStyle.selectedIconColor,
        textColor: SignUpDetailsColorStyle.selectedTextColor,
        tileColor: AppColors.greyColors.shade50,
        selectedTileColor: AppColors.primaryLightColors.shade300,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: BorderSide(color: AppColors.greyColors.shade200),
        ),
      ),
    );
  }
}
