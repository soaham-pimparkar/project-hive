import 'package:flutter/material.dart';

import '../screens/themes/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: AppColors.textColor),
      backgroundColor: const Color.fromARGB(255, 47, 47, 47),
      elevation: 0.0,
      actions: [
        AppBarButton(
            textSize: 25,
            text: "Create New Project",
            textColor: AppColors.textColor,
            backgroundColor: Colors.transparent),
        AppBarButton(
            textSize: 25,
            text: "Browze Projects",
            textColor: AppColors.darkColor,
            backgroundColor: AppColors.appYellow),
        AppBarButton(
            textSize: 25,
            text: "Login",
            textColor: AppColors.textColor,
            backgroundColor: Colors.transparent),
      ],
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            "https://as2.ftcdn.net/v2/jpg/04/84/43/55/1000_F_484435594_6UxpXm1RtQvNnME06g6764sFRL8KAwib.jpg",
            height: 40,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 10),
          Text(
            'My App',
            style: TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
            ),
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
  const AppBarButton(
      {super.key,
      required this.textSize,
      required this.text,
      required this.textColor,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
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
