import 'package:flutter/material.dart';

import '../../../theme/font_styles.dart';

class TitleText extends StatelessWidget {
  final String mainTitle;
  final String subTitle;

  const TitleText({super.key, required this.mainTitle, required this.subTitle});

  @override
  Widget build(BuildContext context) {
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
}
