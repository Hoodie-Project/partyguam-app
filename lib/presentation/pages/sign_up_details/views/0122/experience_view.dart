import 'package:flutter/material.dart';

import '../../../../../core/index.dart';
import '../../../../theme/colors.dart';
import '../../../../theme/styles.dart';
import '../../../../widgets/app_bar.dart';

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

  final List _selectedExperienceItems = [];
  final List _selectedItems = [];

  void _selectTiles(int index) {
    if (_selectedItems.isEmpty) {
      _selectedItems.add(index);
    } else if (_selectedItems.length == 1) {
      _selectedItems.removeAt(0);
      _selectedItems.add(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NoLeadingIconAppBar(title: '경력/포지션 선택'),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        double screenHeight = constraints.maxHeight;

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTitleText('경력'),
                _buildGridView('experience'),
                SizedBox(height: screenHeight * 0.05),
                _buildTitleText('포지션'),
                _buildGridView('position'),
                SizedBox(height: screenHeight * 0.2),
                _buildNextButton(context),
                SizedBox(height: screenHeight * 0.1),
              ],
            ),
          ),
        );
      }),
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

    return GridView.builder(
      shrinkWrap: true,
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
    );
  }

  Widget _buildGridTiles(int index, List<String> currentList) {
    final element = currentList[index];
    final bool isSelected = _selectedItems.contains(index);

    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: () {
        setState(() {
          _selectTiles(index);
        });
      },
      child: GridTile(
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.primaryLightColors.shade300
                : AppColors.greyColors.shade50,
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
                color: isSelected
                    ? AppColors.primaryLightColors.shade100
                    : AppColors.greyColors.shade200),
          ),
          child: Center(
            child: Text(
              element,
              style: TextStyle(
                color: AppColors.greyColors.shade700,
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.normal,
                height: 1.4,
                letterSpacing: -0.25,
              ),
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
