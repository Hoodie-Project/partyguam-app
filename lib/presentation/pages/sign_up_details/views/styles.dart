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

  static WidgetStateColor selectedIcon =
      WidgetStateColor.resolveWith((Set<WidgetState> states) {
    if (states.contains(WidgetState.selected)) {
      return AppColors.primaryDarkColors.shade100;
    }
    return AppColors.greyColors.shade200;
  });

  static WidgetStateColor regularText =
      WidgetStateColor.resolveWith((Set<WidgetState> states) {
    return AppColors.greyColors.shade700;
  });

  static WidgetStateColor selectedTile =
      WidgetStateColor.resolveWith((Set<WidgetState> states) {
    if (states.contains(WidgetState.selected)) {
      return AppColors.primaryLightColors.shade300;
    }
    return AppColors.greyColors.shade50;
  });
}
