import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_hive/globals/appBar.dart';

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(), //replace with default bar later
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                  'Verification email has been sent to your email accout.... Please verify in order to log in'),
              FilledButton(
                  onPressed: () {
                    Get.toNamed('/SignInPage');
                  },
                  child: const Text('Log In'))
            ],
          ),
        ));
  }
}
