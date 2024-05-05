import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../theme/colors.dart';
import '../../../theme/styles.dart';
import '../../../utils/constants.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/snack_bar.dart';
import '../../../widgets/text.dart';
import '../widgets/buttons.dart';
import '../widgets/steppers.dart';
import 'styles.dart';

class SignUpDetail0123 extends StatefulWidget {
  const SignUpDetail0123({super.key});

  @override
  State<SignUpDetail0123> createState() => _SignUpDetail0121State();
}

class _SignUpDetail0121State extends State<SignUpDetail0123> {
  bool _isButtonDisabled = true;
  final List<int> selectedItems = [];

  final timeLabelList = Time.values.map((element) => element.label).toList();
  final timeHoursList = Time.values.map((element) => element.hours).toList();

  void _selectTiles(int index) {
    setState(() {
      // 빈 배열 인경우 (아무 것도 선택 안 했을 때)
      if (selectedItems.isEmpty) {
        _isButtonDisabled = false;
        selectedItems.add(index);
        // 요소가 하나 있는 경우 (한 개 선택 했을 때)
      } else if (selectedItems.length == 1) {
        if (selectedItems.contains(index)) {
          selectedItems.remove(index);
          // _isButtonDisabled = true;
        } else {
          selectedItems.add(index);
        }
        // 요소가 두개 있는 경우 (모두 선택 했을 때)
      } else if (selectedItems.length == 2) {
        if (selectedItems.contains(index)) {
          selectedItems.remove(index);
          // _isButtonDisabled = true;
        } else {
          showWarningSnackBar(context, ' 최대 2개까지 선택할 수 있어요.');
        }
      }
    });
  }

  void _navigateToNextPage() {
    if (selectedItems.isNotEmpty) {
      context.push('/sign_up/detail/0124');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SignInAppBar(title: '세부프로필'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SignUpDetailsStepper(
            currentStep: 2,
            stage: '성향선택(1/4)',
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTitleText(
                  '주로 작업하는 시간대는\n어떻게 되시나요?',
                  '비슷한 성향의 파티원을 추천해 드려요. (최대 2개)',
                ),
                _buildListView(),
              ],
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: _buildNextButton(context),
          ),
          buildSkipButton(
            context,
            '/sign_up/detail/0124',
          ),
        ],
      ),
    );
  }

  Widget _buildListView() {
    return SizedBox(
      height: 350.0,
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return _buildListTiles(index);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 8.0);
        },
        itemCount: timeLabelList.length,
      ),
    );
  }

  Widget _buildListTiles(int index) {
    final timeLabel = timeLabelList[index];
    final timeHours = timeHoursList[index];
    final bool isSelected = selectedItems.contains(index);

    return Material(
      elevation: 1.0,
      shape: isSelected
          ? SignUpDetailsListStyle.selectedBorder
          : SignUpDetailsListStyle.unselectedBorder,
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 20),
        title: Text('$timeLabel $timeHours'),
        titleTextStyle: isSelected
            ? SignUpDetailsListStyle.selectedText
            : SignUpDetailsListStyle.unselectedText,
        // 클릭한 타일 (타일 5개 중에 무엇이 selected 됐는지 확인)
        selected: isSelected,
        onTap: () {
          setState(() {
            _selectTiles(index);
          });
        },
        leading: isSelected
            ? const Icon(Icons.check_circle_rounded)
            : const Icon(Icons.check_circle_outline_rounded),
        iconColor: SignUpDetailsListStyle.selectedIcon,
        textColor: SignUpDetailsListStyle.regularText,
        tileColor: AppColors.greyColors.shade50,
        selectedTileColor: AppColors.primaryLightColors.shade300,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: BorderSide(color: AppColors.greyColors.shade200),
        ),
      ),
    );
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
          onPressed: _isButtonDisabled ? null : _navigateToNextPage,
          style: CommonButtonStyles.filledLongStyle,
          child: const Text('다음'),
        ),
      ),
    );
  }
}
