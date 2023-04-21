import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_hive/screens/authentication_view/sign_up_view.dart';
import 'package:project_hive/screens/landing_page/Landing_Page.dart';

final _auth = FirebaseAuth.instance;
//final authObj = Authentication();
//final databaseObj = database();

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      return const LandingPage();
    } else {
      return const SignUpView();
    }
  }
}
