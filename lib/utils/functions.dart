import 'package:birddie/controllers/russian_roulette_controllers.dart';
import 'package:birddie/screens/gender_dob.dart';
import 'package:flutter/material.dart';

navigate(BuildContext context, Widget page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void toNextPage(PageController controller) {
  controller.nextPage(
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOut,
  );
}

void navigateBack(BuildContext context) {
  Navigator.pop(context);
}

DateTime selectedDate = DateTime.now();

Future selectBirthDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1960, 8),
      lastDate: DateTime(2101));
  if (picked != null && picked != selectedDate) {
    dateOfBirth = picked.toString().substring(0, 10);
  }
}

Future selectRussianRoulleteDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1960, 8),
      lastDate: DateTime(2101));
  if (picked != null && picked != selectedDate) {
    russianRouletteDate = picked.toString().substring(0, 10);
  }
}
