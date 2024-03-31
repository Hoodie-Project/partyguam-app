import 'package:flutter/material.dart';
import 'package:partyguam/app/theme/colors.dart';
import 'package:partyguam/data/mock.dart';

class AddressDropDownMenu extends StatefulWidget {
  const AddressDropDownMenu({super.key});

  @override
  State<AddressDropDownMenu> createState() => _AddressDropDownMenuState();
}

class _AddressDropDownMenuState extends State<AddressDropDownMenu> {
  static const String hintText = '시·도를 선택해 주세요';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      child: DropdownMenu(
        width: 335,
        hintText: hintText,
        inputDecorationTheme: InputDecorationTheme(
            contentPadding: const EdgeInsets.only(left: 20.0),
            hintStyle: TextStyle(
              color: AppColors.greyColors.shade400,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.greyColors.shade200,
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
            )),
        textStyle: TextStyle(
          color: AppColors.greyColors.shade100,
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
        dropdownMenuEntries: ColorLabel.values
            .map<DropdownMenuEntry<ColorLabel>>((ColorLabel color) {
          return DropdownMenuEntry<ColorLabel>(
            value: color,
            label: color.label,
            enabled: color.label != 'Grey',
            style: MenuItemButton.styleFrom(
              foregroundColor: color.color,
            ),
          );
        }).toList(),
      ),
    );
  }
}
