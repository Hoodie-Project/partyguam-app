import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class SignUpDetailsListStyle {
  static RoundedRectangleBorder selectedBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16.0),
    side: BorderSide(color: AppColors.primaryLightColors.shade100),
  );

  static RoundedRectangleBorder unselectedBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16.0),
    side: BorderSide(color: AppColors.greyColors.shade200),
  );

  static TextStyle selectedText = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: AppColors.greyColors.shade700,
  );

  static TextStyle unselectedText = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: AppColors.greyColors.shade700,
  );

  static MaterialStateColor selectedIcon =
      MaterialStateColor.resolveWith((Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      return AppColors.primaryDarkColors.shade100;
    }
    return AppColors.greyColors.shade200;
  });

  static MaterialStateColor regularText =
      MaterialStateColor.resolveWith((Set<MaterialState> states) {
    return AppColors.greyColors.shade700;
  });

  static MaterialStateColor selectedTile =
      MaterialStateColor.resolveWith((Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      return AppColors.primaryLightColors.shade300;
    }
    return AppColors.greyColors.shade50;
  });
}
