import 'package:birddie/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:birddie/providers/user_provider.dart';
import 'package:birddie/utils/extensions/on_string.dart';

class WDrawer extends StatelessWidget {
  const WDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColors.mainWhiteColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: CustomColors.mainRedColor,
            ),
            child: Center(
              child: Text(
                '${context.read<UserProvider>().firstName.toTitleCase()} ${context.read<UserProvider>().lastName.toTitleCase()}',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: CustomColors.mainWhiteColor,
                    ),
              ),
            ),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
