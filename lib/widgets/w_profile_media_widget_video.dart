import 'package:birddie/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WProfileMediaWidgetVideo extends StatelessWidget {
  const WProfileMediaWidgetVideo({
    Key? key,
    required this.onPressed,
    required this.flex,
    required this.text,
  }) : super(key: key);

  final VoidCallback onPressed;
  final int flex;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
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
      ),
    );
  }
}
