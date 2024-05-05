import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class SignIn0000Styles {
  static const RoundedRectangleBorder socialButtonBorder =
      RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(16.0),
    ),
  );

  static final TextStyle socialButtonText = TextStyle(
    color: AppColors.greyColors.shade700,
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    height: 1.4,
    letterSpacing: -0.25,
  );

  static final TextStyle termText1 = TextStyle(
    color: AppColors.greyColors.shade700,
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
    height: 1.4,
    letterSpacing: -0.25,
  );

  static final TextStyle termText2 = TextStyle(
    color: AppColors.greyColors.shade700,
    decoration: TextDecoration.underline,
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
    height: 1.4,
    letterSpacing: -0.25,
  );

  static final TextStyle inquiryText = TextStyle(
    color: AppColors.greyColors.shade500,
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
    height: 1.4,
    letterSpacing: -0.25,
  );
}

class SignUp0111Styles {
  static final TextStyle emailText = TextStyle(
    color: AppColors.greyColors.shade500,
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    height: 1.4,
    letterSpacing: -0.25,
  );
}

class SignUp0114Styles {
  static final TextStyle squareButtonText = TextStyle(
    color: AppColors.greyColors.shade700,
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    height: 1.4,
    letterSpacing: -0.25,
  );
}

class SignUp0115Styles {
  static final TextStyle mainTitle = TextStyle(
    color: AppColors.greyColors.shade700,
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
    height: 1.4,
    letterSpacing: -0.25,
  );
}

/// common styles
class SignUpTextFormStyles {
  static final TextStyle hintText = TextStyle(
    color: AppColors.greyColors.shade400,
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    height: 1.4,
    letterSpacing: -0.25,
  );

  static const TextStyle errorStyle = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 12.0,
    height: 1.4,
    letterSpacing: -0.25,
  );

  static final OutlineInputBorder enabledBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.greyColors.shade200,
      width: 1.0,
    ),
    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
  );

  static const OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.primaryLightColors,
      width: 1.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(16.0)),
  );

  static final OutlineInputBorder errorBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.systemColors.shade100,
      width: 1.0,
    ),
    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
  );

  static final OutlineInputBorder focusedErrorBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.systemColors.shade100,
      width: 1.0,
    ),
    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
  );
}
