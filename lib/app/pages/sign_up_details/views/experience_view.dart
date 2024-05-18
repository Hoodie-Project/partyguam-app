import 'package:flutter/material.dart';

import '../../../theme/colors.dart';
import '../../../theme/styles.dart';
import '../../../utils/constants.dart';
import '../../../widgets/app_bar.dart';

class ExperienceView extends StatefulWidget {
  const ExperienceView({super.key});

  @override
  State<ExperienceView> createState() => _ExperienceViewState();
}

class _ExperienceViewState extends State<ExperienceView> {
  final List<String> experienceList =
      Experience.values.map((element) => element.option).toList();
  final List<String> positionList =
      Position.values.map((element) => element.option).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NoLeadingIconAppBar(title: '경력/포지션 선택'),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitleText('경력'),
            _buildGridView('experience'),
            const SizedBox(
              height: 40.0,
            ),
            _buildTitleText('포지션'),
            _buildGridView('position'),
            _buildNextButton(context),
            const SizedBox(
              height: 20.0,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTitleText(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.greyColors.shade700,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          height: 1.4,
          letterSpacing: -0.25,
        ),
      ),
    );
  }

  Widget _buildGridView(String category) {
    List<String> currentList;

    if (category == 'experience') {
      currentList = experienceList;
    } else {
      currentList = positionList;
    }

    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.only(bottom: 20.0),
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
          mainAxisExtent: 48.0,
        ),
        itemCount: currentList.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildGridTiles(index, currentList);
        },
      ),
    );
  }

  Widget _buildGridTiles(int index, List<String> currentList) {
    final element = currentList[index];

    return GridTile(
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.greyColors.shade50,
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(color: AppColors.greyColors.shade200)),
        child: Center(
          child: Text(
            element,
            style: TextStyle(
              color: AppColors.greyColors.shade700,
              fontSize: 16,
              fontWeight: FontWeight.normal,
              height: 1.4,
              letterSpacing: -0.25,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNextButton(BuildContext context) {
    bool isButtonDisabled = true;
    void addSelection() {}

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isButtonDisabled ? null : addSelection,
        style: CommonButtonStyles.filledLongStyle,
        child: const Text('추가하기'),
      ),
    );
  }
}
