import 'package:flutter/material.dart';
import 'package:project_hive/globals/appBar.dart';

class CreateProjectNoAccessView extends StatelessWidget {
  const CreateProjectNoAccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(), //replace with default bar later
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Oops....You do not have access to this feature :/'),
              const SizedBox(height: 15),
              const Text(
                  'Please check that you have signed in using a non-student account'),
              const SizedBox(height: 15),
              FilledButton(onPressed: () {}, child: const Text('My profile'))
            ],
          ),
        ));
  }
}
