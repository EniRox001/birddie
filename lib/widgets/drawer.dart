import 'package:birddie/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:birddie/providers/user_provider.dart';

class WDrawer extends StatelessWidget {
  const WDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColors.mainWhiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10.0,
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
                '${context.read<UserProvider>().firstName.toUpperCase()} ${context.read<UserProvider>().lastName.toUpperCase()}',
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
