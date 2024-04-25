import 'package:flutter/material.dart';

import '../../../../data/mock.dart';
import '../../../theme/colors.dart';

class AddressDropDownMenu extends StatefulWidget {
  const AddressDropDownMenu({super.key});

  @override
  State<AddressDropDownMenu> createState() => _AddressDropDownMenuState();
}

class _AddressDropDownMenuState extends State<AddressDropDownMenu> {
  final TextEditingController textController = TextEditingController();
  static const String hintText = '시·도';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Material(
        elevation: 1.0,
        borderRadius: BorderRadius.circular(16.0),
        color: AppColors.greyColors.shade50,
        child: DropdownMenu(
          controller: textController,
          dropdownMenuEntries:
              ProvinceMockData.values.map<DropdownMenuEntry<ProvinceMockData>>(
            (ProvinceMockData province) {
              return DropdownMenuEntry(label: province.label, value: province);
            },
          ).toList(),
          hintText: hintText,
          inputDecorationTheme: InputDecorationTheme(
            contentPadding: const EdgeInsets.only(
              left: 20.0,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.greyColors.shade300,
                width: 1.0,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(16.0),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primaryLightColors,
                width: 1.0,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(16.0),
              ),
            ),
            hintStyle: TextStyle(
              color: AppColors.greyColors.shade400,
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          menuHeight: 156.0,
          menuStyle: MenuStyle(
            /// TODO: 메뉴 backgroundColor 하얀색으로 지정
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) {
                return AppColors.greyColors.shade50;
              },
            ),
            minimumSize: MaterialStateProperty.resolveWith(
              (states) {
                return const Size(161.0, 52.0);
              },
            ),
            shape: MaterialStateProperty.resolveWith(
              (states) {
                return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  side: const BorderSide(color: AppColors.primaryLightColors),
                );
              },
            ),
          ),
          selectedTrailingIcon: const Icon(
            Icons.keyboard_arrow_up_rounded,
            color: AppColors.primaryLightColors,
          ),
          textStyle: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16.0,
          ),
          trailingIcon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.greyColors.shade300,
          ),
          requestFocusOnTap: true,
          width: 161.0,
        ),
      ),
    );
  }
}
