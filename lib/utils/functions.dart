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
