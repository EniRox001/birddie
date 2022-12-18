import 'package:birddie/utils/colors.dart';
import 'package:flutter/material.dart';

class WDropDownWidget extends StatelessWidget {
  const WDropDownWidget({
    Key? key,
    required this.labelText,
    required this.selectedValue,
    required this.items,
    this.ignore = false,
    required this.onChanged,
  }) : super(key: key);

  final String labelText;
  final String selectedValue;
  final List<String> items;
  final bool ignore;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: ignore,
      child: DropdownButtonFormField(
        borderRadius: BorderRadius.circular(
          10.0,
        ),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.all(10),

          // labelStyle: const TextStyle(color: Colors.black),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.mainRedColor, width: 1.0),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.mainDarkColor, width: 1.0),
          ),
          labelText: labelText,
          labelStyle: const TextStyle(
            color: AppColors.mainDarkColor,
          ),
        ),
        value: selectedValue,
        isExpanded: true,
        items: items.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
