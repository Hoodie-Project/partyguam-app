import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:partyguam/app/screens/sign_up/widgets/styles.dart';

import '../../../theme/colors.dart';

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
          context.go(route);
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

class SquareButton extends StatefulWidget {
  final String content;
  final Color borderColor;
  final Color containerColor;

  const SquareButton({
    super.key,
    required this.content,
    required this.borderColor,
    required this.containerColor,
  });

  @override
  State<SquareButton> createState() => _SquareButtonState();
}

class _SquareButtonState extends State<SquareButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.containerColor,
      elevation: 1.0,
      borderRadius: const BorderRadius.all(
        Radius.circular(16.0),
      ),
      child: Container(
        height: 163.0,
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.borderColor,
            width: 1.0,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        child: Center(
          child: Text(
            widget.content,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
