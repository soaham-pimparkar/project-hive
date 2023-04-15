import 'package:flutter/material.dart';

void showSnackBar(
    /*int? time,
    {required BuildContext context, required String content}*/
    BuildContext context,
    String content,
    {int? time}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(content),
    duration: Duration(seconds: time ?? 5),
  ));
}

/*class SpaceMaker extends StatelessWidget {
  final percentSpace = int;
  const SpaceMaker({super.key, int? percentSpace = 5});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SizedBox(height: height / percentSpace);
  }
}*/
