import 'package:flutter/material.dart';

import 'colors.dart';

class CommonButtonStyles {
  static final ButtonStyle filledLongStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryLightColors,
    elevation: 1,
    foregroundColor: AppColors.greyColors.shade700,
    minimumSize: const Size(
      335.0,
      52.0,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(16.0),
      ),
    ),
    textStyle: const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
    ),
  );

  static final ButtonStyle filledShortStyle = FilledButton.styleFrom(
    backgroundColor: AppColors.primaryLightColors,
    elevation: 1,
    foregroundColor: AppColors.greyColors.shade700,
    minimumSize: const Size(
      164.0,
      48.0,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(16.0),
      ),
    ),
    textStyle: TextStyle(
      color: AppColors.greyColors.shade700,
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
    ),
  );

  static final ButtonStyle outlinedShortStyle = OutlinedButton.styleFrom(
    side: const BorderSide(color: AppColors.primaryLightColors),
    backgroundColor: AppColors.greyColors.shade50,
    foregroundColor: AppColors.greyColors.shade700,
    minimumSize: const Size(
      164.0,
      48.0,
    ),
    elevation: 1,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(16.0),
      ),
    ),
    textStyle: TextStyle(
      color: AppColors.greyColors.shade700,
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
    ),
  );
}

class CustomFontStyle {
  static const TextStyle loginMainTitle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
    height: 1.4,
    letterSpacing: -0.25,
  );

  static const TextStyle loginSubTitle = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    height: 1.4,
    letterSpacing: -0.25,
  );

  static TextStyle validationErrorMessage = TextStyle(
    color: AppColors.systemColors.shade100,
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
    height: 1.4,
    letterSpacing: -0.25,
  );
}
