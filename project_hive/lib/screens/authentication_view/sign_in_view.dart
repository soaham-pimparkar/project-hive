import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_hive/controllers/input_controllers.dart';
import 'package:project_hive/globals/appBar.dart';
import 'package:project_hive/globals/widgets.dart';
import 'package:project_hive/services/authentication.dart';

final _inputCtr = Get.put(userInputController());
final authObj = Authentication();

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Sign In',
            style: TextStyle(fontSize: 36),
          ),
          FilledButton(
              onPressed: () {
                Get.toNamed('/signUpPage');
              },
              child: const Text('Sign Up instead')),
          const SizedBox(height: 25),
          //sign up form
          formFieldRow(
            useController: _inputCtr.emailidCtr,
            useText: 'Email id:',
          ),
          formFieldRow(
            useController: _inputCtr.passwordCtr,
            useText: 'Password:',
          ),
          FilledButton(
              onPressed: () async {
                await authObj.logInWithEmail(
                    email: _inputCtr.emailidCtr.text,
                    password: _inputCtr.passwordCtr.text,
                    context: context);
                Get.toNamed('/');
              },
              child: const Text('Log in'))
        ],
      ),
    );
  }
}
