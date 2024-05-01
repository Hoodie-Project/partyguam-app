import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class SignUpDetailsBorderStyle {
  static RoundedRectangleBorder selectedBorderStyle = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16.0),
    side: BorderSide(color: AppColors.primaryLightColors.shade100),
  );

  static RoundedRectangleBorder unselectedBorderStyle = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16.0),
    side: BorderSide(color: AppColors.greyColors.shade200),
  );
}

class SignUpDetailsTextStyle {
  static TextStyle selectedTextStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: AppColors.greyColors.shade700,
  );

  static TextStyle unselectedTextStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: AppColors.greyColors.shade700,
  );
}

class SignUpDetailsColorStyle {
  static MaterialStateColor selectedIconColor =
      MaterialStateColor.resolveWith((Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      return AppColors.primaryDarkColors.shade100;
    }
    return AppColors.greyColors.shade200;
  });

  static MaterialStateColor regularTextColor =
      MaterialStateColor.resolveWith((Set<MaterialState> states) {
    return AppColors.greyColors.shade700;
  });

  static MaterialStateColor selectedTileColor =
      MaterialStateColor.resolveWith((Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      return AppColors.primaryLightColors.shade300;
    }
    return AppColors.greyColors.shade50;
  });
}
