import 'package:flutter/material.dart';

import '../theme/colors.dart';

showWarningSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.down,
      duration: const Duration(milliseconds: 3000),
      margin: const EdgeInsets.only(bottom: 150, left: 20.0, right: 20.0),
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_rounded,
            color: AppColors.primaryLightColors,
            size: 16.0,
          ),
          Text(
            content,
            style: TextStyle(
              color: AppColors.greyColors.shade50,
              fontWeight: FontWeight.w700,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.greyColors.shade600,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      // width: 375.0,
    ),
  );
}
