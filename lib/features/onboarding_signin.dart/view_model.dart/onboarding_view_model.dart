import 'package:flutter/material.dart';

void toNextPage(PageController controller) {
  controller.nextPage(
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOut,
  );
}
