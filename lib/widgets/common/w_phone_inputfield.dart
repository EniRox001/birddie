import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class WPhoneInputField extends StatelessWidget {
  const WPhoneInputField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.25,
      height: 70.0,
      child: IntlPhoneField(
        controller: controller,
        dropdownIconPosition: IconPosition.trailing,
        showDropdownIcon: false,
        showCountryFlag: false,
        decoration: InputDecoration(
          isDense: false,
          filled: true,
          fillColor: Colors.white,
          hintText: "PHONE NUMBER",
          hintStyle: const TextStyle(
            fontSize: 14.0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1000.0),
          ),
        ),
        initialCountryCode: 'NG',
        onChanged: (phone) {},
      ),
    );
  }
}
