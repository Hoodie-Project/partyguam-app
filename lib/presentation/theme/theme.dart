import 'package:flutter/material.dart';

import 'colors.dart';

final ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.greyColors.shade50,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.greyColors.shade700,
        fontSize: 16,
        fontFamily: 'SUIT',
        fontWeight: FontWeight.w700,
      ),
      centerTitle: true,
    ),
    brightness: Brightness.light,
    fontFamily: 'SUIT',
    scaffoldBackgroundColor: AppColors.greyColors.shade50,
    useMaterial3: true,
    canvasColor: AppColors.greyColors.shade50,
    dialogBackgroundColor: AppColors.greyColors.shade50,
    listTileTheme: ListTileThemeData(
      titleTextStyle: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          color: AppColors.greyColors.shade700),
    )
    // colorScheme: ColorScheme.fromSeed(
    //   brightness: Brightness.light,
    //   seedColor: AppColors.primaryLightColors,
    //   primary: AppColors.greyColors.shade50,
    //   onPrimary: AppColors.greyColors.shade50,
    //   error: AppColors.systemColors.shade100,
    //   errorContainer: AppColors.systemColors.shade100,
    // ),
    );
