import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:partyguam/app/widgets/alert_dialog.dart';

import '../../../theme/colors.dart';

class LoginAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const LoginAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            context.go('/');
          },
        )
      ],
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.navigate_before),
        onPressed: () {
          context.pop();
        },
      ),
      title: Text(title),
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class SignUpAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String route;
  final String pageCount;

  const SignUpAppBar(
      {super.key,
      required this.title,
      required this.pageCount,
      required this.route});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Text(
            pageCount,
            style: TextStyle(
              color: AppColors.greyColors.shade500,
              fontSize: 14.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.navigate_before),
        onPressed: () {
          context.pop();
        },
      ),
      title: Text(title),
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class DialogAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String route;
  final String pageCount;

  const DialogAppBar(
      {super.key,
      required this.title,
      required this.pageCount,
      required this.route});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Text(
            pageCount,
            style: TextStyle(
              color: AppColors.greyColors.shade500,
              fontSize: 14.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.navigate_before),
        onPressed: () {
          showExitDialog(context, '/');
        },
      ),
      title: Text(title),
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
