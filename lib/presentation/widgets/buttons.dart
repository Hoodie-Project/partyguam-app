import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/colors.dart';
import '../theme/styles.dart';

Widget buildFilledLongButton(
    BuildContext context, String content, String route) {
  return SizedBox(
    width: double.infinity,
    child: Material(
      color: AppColors.greyColors.shade50,
      elevation: 1.0,
      borderRadius: const BorderRadius.all(
        Radius.circular(16.0),
      ),
      child: ElevatedButton(
        onPressed: () {
          context.push(route);
        },
        style: CommonButtonStyles.filledLongStyle,
        child: Text(content),
      ),
    ),
  );
}

Widget buildFilledShortButton(
    BuildContext context, String content, String route) {
  return Material(
    color: AppColors.greyColors.shade50,
    elevation: 1.0,
    borderRadius: const BorderRadius.all(
      Radius.circular(16.0),
    ),
    child: FilledButton(
      onPressed: () {
        context.push(route);
      },
      style: CommonButtonStyles.filledShortStyle,
      child: Text(content),
    ),
  );
}

Widget buildOutlinedShortButton(
    BuildContext context, String content, String route) {
  return Material(
    color: AppColors.greyColors.shade50,
    elevation: 1.0,
    borderRadius: const BorderRadius.all(
      Radius.circular(16.0),
    ),
    child: OutlinedButton(
      onPressed: () {
        context.go(route);
      },
      style: CommonButtonStyles.outlinedShortStyle,
      child: Text(content),
    ),
  );
}
