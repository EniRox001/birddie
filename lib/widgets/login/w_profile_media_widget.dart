import 'package:birddie/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WProfileMediaWidget extends StatelessWidget {
  const WProfileMediaWidget({
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
          image: DecorationImage(
            image: NetworkImage(
              context.read<UserProvider>().profilePicture,
            ),
            fit: BoxFit.cover,
          ),
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
