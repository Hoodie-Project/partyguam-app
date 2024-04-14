import 'package:flutter/material.dart';
import 'package:partyguam/app/screens/sign_up/widgets/app_bar.dart';
import 'package:partyguam/app/screens/sign_up_details/widgets/chip.dart';
import 'package:partyguam/app/screens/sign_up_details/widgets/drop_down_menu.dart';

class SignUp0121 extends StatefulWidget {
  const SignUp0121({super.key});

  @override
  State<SignUp0121> createState() => _SignUp0121State();
}

class _SignUp0121State extends State<SignUp0121> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: LoginAppBar(title: '세부프로필'),
      body: Column(
        children: [
          AddressDropDownMenu(),
          AddressChip(),
          PositionChip(),
        ],
      ),
    );
  }
}
