import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_hive/controllers/input_controllers.dart';
import 'package:project_hive/globals/appBar.dart';
import 'package:project_hive/globals/widgets.dart';
import 'package:project_hive/models/project_model.dart';
import 'package:project_hive/screens/authentication_view/sign_up_view.dart';
import 'package:project_hive/services/authentication.dart';
import 'package:project_hive/services/database.dart';
import 'package:uuid/uuid.dart';

final _auth = FirebaseAuth.instance;
//final authObj = Authentication();
//final databaseObj = database();

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      return Scaffold(
          appBar: CustomAppBar(),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [],
            ),
          ));
    } else {
      return SignUpView();
    }
  }
}
