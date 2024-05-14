import 'package:flutter/material.dart';

import '../theme/styles.dart';

Widget buildTitleText(String mainTitle, String subTitle) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        mainTitle,
        style: CustomFontStyle.loginMainTitle,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 12.0, bottom: 40.0),
        child: Text(
          subTitle,
          style: CustomFontStyle.loginSubTitle,
        ),
      ),
    ],
  );
}
