import 'package:birddie/utils/colors.dart';
import 'package:flutter/material.dart';

class WMiniButton extends StatelessWidget {
  const WMiniButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.color = AppColors.mainRedColor});

  final VoidCallback onPressed;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: color, shape: const StadiumBorder()),
      onPressed: onPressed,
      child: Text(
        text,
      ),
    );
  }
}
