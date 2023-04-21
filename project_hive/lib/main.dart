import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:project_hive/globals/testPage.dart';
import 'package:project_hive/screens/authentication_view/sign_up_view.dart';
import 'package:project_hive/screens/browse_projects_view/browse_projects_page.dart';
import 'package:project_hive/screens/create_project_view/create_project_view.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:project_hive/globals/testPage.dart';
// import 'package:project_hive/screens/create_project_view/create_project_no_access.dart';
// import 'package:project_hive/screens/create_project_view/create_project_view.dart';
import 'package:project_hive/screens/my_projects/mainProjectScreen.dart';
import 'package:project_hive/screens/team_apply/application.dart';
import 'package:project_hive/screens/profile_view/my_profile.dart';
import 'package:project_hive/screens/themes/themes.dart';
import 'firebase_options.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    //print('main.dart print called');
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppThemes.mainTheme,
      home: TeamApplyPage(
        uid: '1bf42975-0617-4358-ae85-3130d5a334d0',
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', title: 'Home', page: () => testPage()),
        GetPage(
            name: '/signUpPage',
            title: 'Sign Up',
            page: () => SignUpView()),
      ],
      // home: StudentProjectView(
      //   uid: 's2vRXXzhYmRnlppitIrsammvMhg2',
      // ),
      // home: StudentProjectView(
      //   uid: 's2vRXXzhYmRnlppitIrsammvMhg2',
      // ),
      //home: testPage(),
    );
  }
}
