import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../theme/colors.dart';
import 'styles.dart';

class MainHorizontalButton extends StatelessWidget {
  final String route;
  final String content;

  const MainHorizontalButton({
    super.key,
    required this.content,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
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
          style: ButtonStyles.filledLongStyle,
          child: Text(content),
        ),
      ),
    );
  }
}

class FilledShortButton extends StatelessWidget {
  final String content;
  final String route;

  const FilledShortButton(
      {super.key, required this.content, required this.route});

  @override
  Widget build(BuildContext context) {
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
        style: ButtonStyles.filledShortStyle,
        child: Text(content),
      ),
    );
  }
}

class OutlinedShortButton extends StatelessWidget {
  final String content;
  final String route;

  const OutlinedShortButton(
      {super.key, required this.content, required this.route});

  @override
  Widget build(BuildContext context) {
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
        style: ButtonStyles.outlinedShortStyle,
        child: Text(content),
      ),
    );
  }
}
