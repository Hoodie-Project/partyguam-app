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
        initialSelection: ProvinceMockData.seoul,
        width: 335.0,
        hintText: hintText,
        textStyle: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 16.0,
        ),
        menuHeight: 156.0,
        menuStyle: MenuStyle(
          // alignment: Alignment.centerLeft,
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) => Colors.white,
          ),
          minimumSize: MaterialStateProperty.resolveWith(
            (states) => Size(335.0, 156.0),
          ),
          shape: MaterialStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
              side: BorderSide(color: AppColors.primaryLightColors),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.only(left: 20.0),
          hintStyle: TextStyle(
            color: AppColors.greyColors.shade400,
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
          ),
          // border: OutlineInputBorder(
          //   borderSide: BorderSide(
          //     color: Colors.blue,
          //     width: 1.0,
          //   ),
          //   borderRadius: const BorderRadius.all(
          //     Radius.circular(16.0),
          //   ),
          // ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
              width: 1.0,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
        ),
        // menuStyle: MenuStyle(),
        selectedTrailingIcon: const Icon(
          Icons.keyboard_arrow_up_rounded,
          color: AppColors.primaryLightColors,
        ),
        trailingIcon: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: AppColors.greyColors.shade300,
        ),
        dropdownMenuEntries:
            ProvinceMockData.values.map<DropdownMenuEntry<ProvinceMockData>>(
          (ProvinceMockData province) {
            return DropdownMenuEntry(label: province.label, value: province);
          },
        ).toList(),
        // dropdownMenuEntries: ColorLabel.values
        //     .map<DropdownMenuEntry<ColorLabel>>((ColorLabel color) {
        //   return DropdownMenuEntry<ColorLabel>(
        //     value: color,
        //     label: color.label,
        //     enabled: color.label != 'Grey',
        //     style: MenuItemButton.styleFrom(
        //       foregroundColor: color.color,
        //     ),
        //   );
        // }).toList(),
      ),
    );
  }
}
