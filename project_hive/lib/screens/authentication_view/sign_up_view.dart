import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Sign Up',
              style: TextStyle(fontSize: 36),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Account Type:'),
                SizedBox(
                  width: 25,
                ),
                DropdownButton(items: [
                  DropdownMenuItem(child: Text('Student'), value: 'student'),
                  DropdownMenuItem(
                      child: Text('Company Representative'),
                      value: 'companyEmployee'),
                  DropdownMenuItem(
                      child: Text('Institute Faculty'),
                      value: 'instituteFaculty'),
                  DropdownMenuItem(
                      child: Text('Independent User'),
                      value: 'independentUser'),
                ], onChanged: (String) {})
              ],
            )
          ]),
    );
  }
}
