import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/colors.dart';
import 'alert_dialog.dart';

class SignInAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SignInAppBar({super.key, required this.title});

  final String title;

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
  const SignUpAppBar({
    super.key,
    required this.title,
    required this.pageCount,
  });

  final String title;
  final String pageCount;

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
  const DialogAppBar({
    super.key,
    required this.title,
    required this.pageCount,
  });

  final String title;
  final String pageCount;

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

class NoIconsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NoIconsAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      leading: const Text(''),
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

class ExitIconAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ExitIconAppBar({
    super.key,
  });

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
      centerTitle: true,
      elevation: 0,
      leading: const Text(''),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class NoLeadingIconAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const NoLeadingIconAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            context.pop();
          },
        )
      ],
      backgroundColor: Colors.white,
      elevation: 0,
      leading: const Text(''),
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
