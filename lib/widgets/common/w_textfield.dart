import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WTextField extends StatelessWidget {
  const WTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.inputType = TextInputType.text,
      this.inputFormatters = const <TextInputFormatter>[],
      this.validator})
      : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final TextInputType inputType;
  final List inputFormatters;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: inputType,
      inputFormatters: const [],
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.all(10),
        hintText: hintText,
        // labelStyle: const TextStyle(color: Colors.black),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
      ),
    );
  }
}
