import 'package:flutter/material.dart';
import '../screens/themes/app_colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.darkColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.appYellow,
            ),
            child: const Text('Menu'),
          ),
          ListTile(
            title: Text('Item 1', style: TextStyle(color: AppColors.textColor)),
            onTap: () {},
          ),
          ListTile(
            title: Text('Item 2', style: TextStyle(color: AppColors.textColor)),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
