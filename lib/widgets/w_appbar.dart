import 'package:flutter/material.dart';

class WAppBar extends StatelessWidget {
  const WAppBar({
    Key? key,
    required this.title,
    required this.subData,
    required this.onBackPressed,
    this.subDataText = 'Premium: Monthly',
  }) : super(key: key);

  final String title;
  final String subDataText;
  final bool subData;
  final VoidCallback onBackPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      decoration: BoxDecoration(
        color: const Color(0xFFFF5454),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: subData
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: onBackPressed,
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(title,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: const Color(0xFFFFEE54))),
            Container(
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: subData
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Premium: Monthly',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.white),
                      ),
                    )
                  : const SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
