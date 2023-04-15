import 'package:flutter/material.dart';

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(), //replace with default bar later
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  'Verification email has been sent to your email accout.... Please verify in order to log in'),
              FilledButton(onPressed: () {}, child: Text('Open Gmail'))
            ],
          ),
        ));
  }
}
