import 'package:flutter/material.dart';
import 'package:partyguam/app/theme/colors.dart';

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
            vertical: 2.5,
          ),
        ),
      ],
    );
  }
}
