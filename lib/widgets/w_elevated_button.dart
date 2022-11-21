import 'package:flutter/material.dart';

class WElevatedButton extends StatelessWidget {
  const WElevatedButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.outlined = false,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final bool outlined;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          side: outlined
              ? const BorderSide(
                  color: Color(
                    0xFFFF5454,
                  ),
                  width: 2.0)
              : null,
          backgroundColor: outlined
              ? Colors.white
              : const Color(
                  0xFFFF5454,
                ),
          shape: const StadiumBorder()),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 50.0),
        child: Text(
          text,
          style: outlined
              ? Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: const Color(0xFFFF5454))
              : Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
