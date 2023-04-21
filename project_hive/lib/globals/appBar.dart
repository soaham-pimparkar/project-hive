import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_hive/globals/themes/app_colors.dart';

//import '../screens/themes/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    double useWidth = MediaQuery.of(context).size.width;
    double useHeight = MediaQuery.of(context).size.height;
    return AppBar(
      iconTheme: IconThemeData(color: AppColors.textColor),
      backgroundColor: const Color.fromARGB(255, 47, 47, 47),
      elevation: 0.0,
      actions: [
        AppBarButton(
            useHeight: useHeight,
            useWidth: useWidth,
            path: '/createProjectPage',
            textSize: 15,
            text: "Create New Project",
            textColor: AppColors.textColor,
            backgroundColor: Colors.transparent),
        AppBarButton(
            useHeight: useHeight,
            useWidth: useWidth,
            textSize: 15,
            path: '/browseProjectsPage',
            text: "Browse Projects",
            textColor: AppColors.darkColor,
            backgroundColor: AppColors.appYellow),
        AppBarButton(
            useHeight: useHeight,
            useWidth: useWidth,
            textSize: 15,
            path: '/signInPage',
            text: "Login",
            textColor: AppColors.textColor,
            backgroundColor: Colors.transparent),
        AppBarButton(
            useHeight: useHeight,
            useWidth: useWidth,
            path: '/myProfilePage',
            textSize: 15,
            text: "Account",
            textColor: AppColors.textColor,
            backgroundColor: Colors.transparent),
      ],
      leading: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              Get.toNamed('/');
            },
            icon: const Icon(Icons.home),
          ),
          SizedBox(width: useWidth / 20),
          Text(
            'ProjectHive',
            style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 24),
          ),
        ],
      ),
    );
  }
}

class AppBarButton extends StatelessWidget {
  final double textSize;
  final String text;
  final Color textColor;
  final Color backgroundColor;
  String path;
  double useHeight;
  double useWidth;
  AppBarButton({
    super.key,
    required this.textSize,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    required this.useHeight,
    required this.useWidth,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(path);
      },
      child: Container(
        width: useWidth / 10,
        height: double.infinity,
        decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(width: 0, color: Colors.black)),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: TextStyle(fontSize: textSize, color: textColor),
          ),
        )),
      ),
    );
  }
}
