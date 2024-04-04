import 'package:flutter/material.dart';
import 'package:partyguam/app/screens/sign_up/widgets/app_bar.dart';
import 'package:partyguam/app/screens/sign_up_details/widgets/drop_down_menu.dart';
import 'package:partyguam/app/theme/colors.dart';

class SignUp0121 extends StatefulWidget {
  const SignUp0121({super.key});

  @override
  State<SignUp0121> createState() => _SignUp0121State();
}

class _SignUp0121State extends State<SignUp0121> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = false;

    return Scaffold(
      appBar: LoginAppBar(title: '세부프로필'),
      body: Column(
        children: [
          AddressDropDownMenu(),
          SizedBox(
            width: double.infinity,
            height: 44.0,
            child: InputChip(
              label: Text('서울특별시'),
              // labelPadding:
              //     EdgeInsets.only(left: 16.0, top: 12.0, bottom: 12.0),
              selected: isSelected,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: AppColors.primaryLightColors,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
              onSelected: (bool selected) {
                setState(() {
                  isSelected = !isSelected;
                });
              },
              selectedColor: Colors.blue,
              deleteIcon: Icon(
                Icons.clear_rounded,
                size: 12.0,
              ),
              onDeleted: () {},
            ),
          ),
        ],
      ),
    );
  }
}
