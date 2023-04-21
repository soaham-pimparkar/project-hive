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
            const Text(
              'Sign Up',
              style: TextStyle(fontSize: 36),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Account Type:'),
                const SizedBox(
                  width: 25,
                ),
                DropdownButton(items: const [
                  DropdownMenuItem(value: 'student', child: Text('Student')),
                  DropdownMenuItem(
                      value: 'companyEmployee',
                      child: Text('Company Representative')),
                  DropdownMenuItem(
                      value: 'instituteFaculty',
                      child: Text('Institute Faculty')),
                  DropdownMenuItem(
                      value: 'independentUser',
                      child: Text('Independent User')),
                ], onChanged: (String) {})
              ],
            )
          ]),
    );
  }
}
