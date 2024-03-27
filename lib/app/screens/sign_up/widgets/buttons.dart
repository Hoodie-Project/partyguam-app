import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../theme/colors.dart';

/// buttonStyles
final ButtonStyle filledLongStyle = ElevatedButton.styleFrom(
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

final ButtonStyle filledShortStyle = FilledButton.styleFrom(
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

final ButtonStyle outlinedShortStyle = OutlinedButton.styleFrom(
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

/// buttons
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
          style: filledLongStyle,
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
        style: filledShortStyle,
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
        style: outlinedShortStyle,
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
