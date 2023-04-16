//firebase packages
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:project_hive/globals/testPage.dart';
// import 'package:project_hive/screens/create_project_view/create_project_no_access.dart';
// import 'package:project_hive/screens/create_project_view/create_project_view.dart';
import 'package:project_hive/screens/my_projects/mainProjectScreen.dart';
import 'firebase_options.dart';

//other pub.dev packages
// import 'package:get/get.dart';

//local files
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
    print('main.dart print called');
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        useMaterial3: true,
      ),
      // home: StudentProjectView(
      //   uid: 's2vRXXzhYmRnlppitIrsammvMhg2',
      // ),
      home: StudentProjectView(
          // uid: 's2vRXXzhYmRnlppitIrsammvMhg2',
          ),
    );
  }
}
