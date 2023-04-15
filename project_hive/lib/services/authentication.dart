import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_hive/globals/widgets.dart';
import 'package:project_hive/models/company_employee_model.dart';
import 'package:project_hive/models/independent_user.dart';
import 'package:project_hive/models/institute_faculty_model.dart';
import 'package:project_hive/models/student_model.dart';
import 'package:project_hive/services/database.dart';

class Authentication {
  //final database _database;
  database _database = database();
  final _auth = FirebaseAuth.instance;

  //Authentication();

  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required BuildContext context,
    StudentModel? student,
    CompanyEmployeeModel? companyEmployee,
    InstituteFacultyModel? institueFaculty,
    IndependentUserModel? independentUser,
  }) async {
    try {
      /*dynamic userModel;
      if (student != null) {
        userModel = student;
      } else if (companyEmployee != null) {
        userModel = companyEmployee;
      } else if (institueFaculty != null) {
        userModel = institueFaculty;
      } else if (independentUser != null) {
        userModel = independentUser;
      } else {
        throw Exception("Valid user type not found");
      }*/
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await sendVerificationMail(context);

      if (_auth.currentUser == null) {
        throw Exception("User is null");
      } else {
        String sendUid = _auth.currentUser!.uid;

        if (student != null) {
          _database.createUserRecord(
              useUid: sendUid, context: context, student: student);
        } else if (companyEmployee != null) {
          _database.createUserRecord(
              useUid: sendUid,
              context: context,
              companyEmployee: companyEmployee);
        } else if (institueFaculty != null) {
          _database.createUserRecord(
              useUid: sendUid,
              context: context,
              institueFaculty: institueFaculty);
        } else if (independentUser != null) {
          _database.createUserRecord(
              useUid: sendUid,
              context: context,
              independentUser: independentUser);
        } else {
          throw Exception("Valid user type not found");
        }
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      showSnackBar(context, e.toString());
    } /*catch{
      showSnackBar(context, "Oops! something went wrong :/");
    }*/
    catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> sendVerificationMail(BuildContext context) async {
    try {
      await _auth.currentUser!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
