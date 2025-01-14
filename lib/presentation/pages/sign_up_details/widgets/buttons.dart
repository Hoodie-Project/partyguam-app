import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../theme/colors.dart';

Widget buildSkipButton(BuildContext context, String route) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 20.0),
      child: TextButton(
        onPressed: () {
          context.push(route);
        },
        child: Text(
          '건너뛰기',
          style: TextStyle(
            color: AppColors.greyColors.shade500,
            decoration: TextDecoration.underline,
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    ),
  );
}
