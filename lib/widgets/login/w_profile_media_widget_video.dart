import 'package:flutter/material.dart';

class WProfileMediaWidgetVideo extends StatelessWidget {
  const WProfileMediaWidgetVideo({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFFF5454), width: 2.0),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.add,
              size: 50.0,
              color: Colors.grey,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: const Color(0xFFFF5454),
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
