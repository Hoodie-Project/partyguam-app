import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/constants.dart';
import '../../../routes/route_path.dart';
import '../../../theme/colors.dart';
import '../../../theme/styles.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/text.dart';
import '../widgets/buttons.dart';
import '../widgets/steppers.dart';
import 'styles.dart';

class SignUpDetail0124 extends StatefulWidget {
  const SignUpDetail0124({super.key});

  @override
  State<SignUpDetail0124> createState() => _SignUpDetail0121State();
}

class _SignUpDetail0121State extends State<SignUpDetail0124> {
  bool _isButtonDisabled = true;
  final List<int> selectedItems = [];

  final List<String> personalityList =
      Personality.values.map((element) => element.option).toList();

  void _selectTiles(int index) {
    if (selectedItems.isEmpty) {
      _isButtonDisabled = false;
      selectedItems.add(index);
    } else if (selectedItems.isNotEmpty) {
      if (selectedItems[0] == index) {
        selectedItems.remove(index);
        _isButtonDisabled = true;
      } else {
        selectedItems.removeAt(0);
        selectedItems.add(index);
      }
    }
  }

  void _navigateToNextPage() {
    if (selectedItems.isNotEmpty) {
      context.push('${RouterPath.signUp}/detail/0125');
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
            stage: '성향선택(2/4)',
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTitleText(
                  '가장 가깝다고 생각하는 성향은\n무엇인가요?',
                  '비슷한 성향의 파티원을 추천해 드려요.',
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
            '${RouterPath.signUp}/detail/0125',
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
        itemCount: personalityList.length,
      ),
    );
  }

  _buildListTiles(int index) {
    final personality = personalityList[index];
    final bool isSelected = selectedItems.contains(index);

    return Material(
      elevation: 1.0,
      shape: isSelected
          ? SignUpDetailsListStyle.selectedBorder
          : SignUpDetailsListStyle.unselectedBorder,
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 20),
        title: Text(personality),
        titleTextStyle: isSelected
            ? SignUpDetailsListStyle.selectedText
            : SignUpDetailsListStyle.unselectedText,
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
          side: BorderSide(
            color: AppColors.greyColors.shade200,
          ),
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
