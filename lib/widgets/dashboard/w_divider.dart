import 'package:flutter/material.dart';
import 'package:birddie/utils/colors.dart';

class WDivider extends StatelessWidget {
  const WDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Divider(
        color: AppColors.fadedRedColor,
        thickness: 2.0,
      ),
    );
  }
}
