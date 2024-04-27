import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class TextFormBorderStyles {
  static final OutlineInputBorder enabledBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.greyColors.shade200,
      width: 1.0,
    ),
    borderRadius: const BorderRadius.all(
      Radius.circular(16.0),
    ),
  );

  static const OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.primaryLightColors,
      width: 1.0,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(16.0),
    ),
  );

  static final OutlineInputBorder errorBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.systemColors.shade100,
      width: 1.0,
    ),
    borderRadius: const BorderRadius.all(
      Radius.circular(16.0),
    ),
  );

  static final OutlineInputBorder focusedErrorBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.systemColors.shade100,
      width: 1.0,
    ),
    borderRadius: const BorderRadius.all(
      Radius.circular(16.0),
    ),
  );
}

class ButtonStyles {
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
