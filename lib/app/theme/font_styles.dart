import 'package:flutter/material.dart';

import 'colors.dart';

class CustomFontStyle {
  static const TextStyle loginMainTitle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle loginSubTitle = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
  );

  static TextStyle validationErrorMessage = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
    color: AppColors.systemColors.shade100,
  );
}
