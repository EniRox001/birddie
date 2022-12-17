import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WOtpField extends StatelessWidget {
  const WOtpField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.inputType = TextInputType.text,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.25,
      height: 50.0,
      child: TextFormField(
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        keyboardType: inputType,
        validator: validator,
        textAlign: TextAlign.center,
        controller: controller,
        decoration: InputDecoration(
          errorStyle: const TextStyle(fontSize: 10.0),
          isDense: false,
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 14.0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1000.0),
          ),
        ),
      ),
    );
  }
}
