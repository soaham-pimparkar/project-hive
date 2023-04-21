import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:project_hive/screens/team_apply/application.dart';
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
    log('main.dart print called');
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        useMaterial3: true,
      ),
      home: TeamApplyPage(
        uid: '1bf42975-0617-4358-ae85-3130d5a334d0',
      ),
    );
  }
}
