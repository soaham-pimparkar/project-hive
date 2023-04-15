import 'package:flutter/material.dart';

class CreateProjectNoAccessView extends StatelessWidget {
  const CreateProjectNoAccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(), //replace with default bar later
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Oops....You do not have access to this feature :/'),
              SizedBox(height: 15),
              Text(
                  'Please check that you have signed in using a non-student account'),
              SizedBox(height: 15),
              FilledButton(onPressed: () {}, child: Text('My profile'))
            ],
          ),
        ));
  }
}
