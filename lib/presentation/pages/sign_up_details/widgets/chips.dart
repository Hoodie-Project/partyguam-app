import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class AddressChip extends StatefulWidget {
  const AddressChip({super.key});

  @override
  State<AddressChip> createState() => _AddressChipState();
}

class _AddressChipState extends State<AddressChip> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Chip(
          backgroundColor: AppColors.greyColors.shade50,
          deleteIcon: const Icon(
            Icons.clear_rounded,
            size: 12.0,
          ),
          label: const Text('서울 종로구'),
          labelStyle: TextStyle(
            color: AppColors.greyColors.shade700,
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
          ),
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: AppColors.primaryLightColors,
            ),
            borderRadius: BorderRadius.circular(999.0),
          ),
          onDeleted: () {},
          // padding:
          //     EdgeInsets.only(top: 8.0, bottom: 8.0, left: 12.0, right: 12.0),
          visualDensity: const VisualDensity(
            horizontal: 2.0,
            vertical: -1.0,
          ),
        ),
      ],
    );
  }
}

class PositionChip extends StatefulWidget {
  const PositionChip({super.key});

  @override
  State<PositionChip> createState() => _PositionChipState();
}

class _PositionChipState extends State<PositionChip> {
  bool _isSelected = false;

  void _chipSelection() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      backgroundColor: _isSelected
          ? AppColors.greyColors.shade50
          : AppColors.primaryLightColors.shade300,
      elevation: 1.0,
      label: const Text('영상/모션디자이너'),
      labelStyle: TextStyle(
        color: AppColors.greyColors.shade600,
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
      ),
      onPressed: () {
        _chipSelection();
      },
      shape: RoundedRectangleBorder(
        side: _isSelected
            ? BorderSide(
                color: AppColors.greyColors.shade200,
              )
            : BorderSide(
                color: AppColors.primaryLightColors.shade100,
              ),
        borderRadius: BorderRadius.circular(999.0),
      ),
      // padding:
      //     EdgeInsets.only(top: 8.0, bottom: 8.0, left: 12.0, right: 12.0),
      visualDensity: const VisualDensity(
        vertical: -1.0,
      ),
    );
  }
}
