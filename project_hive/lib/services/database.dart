import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_hive/globals/widgets.dart';
import 'package:project_hive/models/application_model.dart';
import 'package:project_hive/models/company_employee_model.dart';
import 'package:project_hive/models/independent_user.dart';
import 'package:project_hive/models/institute_faculty_model.dart';
import 'package:project_hive/models/project_model.dart';
import 'package:project_hive/models/student_model.dart';
//import 'package:uuid/uuid.dart';

class database {
  final _firestore = FirebaseFirestore.instance;

  //create user
  Future<void> createUserRecord({
    required String useUid,
    required BuildContext context,
    StudentModel? student,
    CompanyEmployeeModel? companyEmployee,
    InstituteFacultyModel? institueFaculty,
    IndependentUserModel? independentUser,
  }) async {
    dynamic userModel;
    String userType;
    if (student != null) {
      student.uid = useUid;
      userModel = student;
      userType = "students";
    } else if (companyEmployee != null) {
      companyEmployee.uid = useUid;
      userModel = companyEmployee;
      userType = "companyEmployee";
    } else if (institueFaculty != null) {
      institueFaculty.uid = useUid;
      userModel = institueFaculty;
      userType = "instituteFaculty";
    } else if (independentUser != null) {
      independentUser.uid = useUid;
      userModel = independentUser;
      userType = "independentUser";
    } else {
      throw Exception("Valid user type not found");
    }
    try {
      await _firestore.doc("$userType/$useUid").set(userModel.toMap());
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //change user details

  //create project
  Future<void> createProjectRecord({
    required BuildContext context,
    required ProjectModel project,
  }) async {
    try {
      await _firestore.doc("projects/${project.uid}").set(project.toMap());
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> createApplicationRecord(
      {required BuildContext context,
      required ApplicationModel application,
      required String projectUid,
      required String studentUid}) async {
    try {
      //add application record in project subcollection
      await _firestore
          .doc("projects/$projectUid/${application.uid}")
          .set(application.toMap());

      //add application uid in student
      List<String> useArray = [];
      final docRef = _firestore.collection("students").doc("$studentUid");
      docRef.get().then(
        (DocumentSnapshot doc) {
          final data = doc.data() as Map<String, dynamic>;
          useArray = data['affiliatedProjects'];
        },
        onError: (e) => print("Error getting document: $e"),
      );
      useArray.add('${application.uid}');
      await _firestore
          .doc("students/$studentUid")
          .update({'affiliatedProjects': '$useArray'});

      //add application uid in owner
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
