import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_hive/globals/widgets.dart';
import 'package:project_hive/models/company_employee_model.dart';
import 'package:project_hive/models/independent_user.dart';
import 'package:project_hive/models/institute_faculty_model.dart';
import 'package:project_hive/models/project_model.dart';
import 'package:project_hive/models/student_model.dart';
import 'package:project_hive/services/authentication.dart';
import 'package:uuid/uuid.dart';

final _auth = Authentication();

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

  Future<List<Map<dynamic, dynamic>>> readSelectedProjects({
    required String useUid,
    required BuildContext context,
  }) async {
    List<Map<dynamic, dynamic>> applications = [];
    try {
      DocumentSnapshot studentInfo =
          await _firestore.doc("/students/$useUid").get();
      Map<dynamic, dynamic> temp = studentInfo.data() as Map<dynamic, dynamic>;
      // Map<String, dynamic>.from(t1)
      for (String uid in temp["appliedProjects"]) {
        DocumentSnapshot<Map<String, dynamic>> t1 =
            await _firestore.doc("/projects/$uid").get();
        if (t1.exists && t1.data() != null) {
          applications.add(Map<String, dynamic>.from(t1.data()!));
        }
      }
      log("In function: $applications");
      return applications;
    } catch (e) {
      showSnackBar(context, e.toString());
      return [];
    }
  }

  Future<void> makeNewApplication(Map<String, dynamic> data,
      BuildContext context, String projectUid) async {
    String applicantUid = await _auth.getUserUid(context: context);
    String applicationUid = const Uuid().v4();

    await _firestore.doc("projects/$projectUid").update({
      "receivedApplications": FieldValue.arrayUnion([applicationUid])
    });
    await _firestore.doc("applications/$applicationUid").set(data);

    await _firestore.doc("students/$applicantUid").update({
      "appliedProjects": FieldValue.arrayUnion([applicationUid])
    });
  }

  Future<List<Map<dynamic, dynamic>>> getProjectDetails({
    required String useUid,
    required BuildContext context,
  }) async {
    List<Map<dynamic, dynamic>> applications = [];
    try {
      DocumentSnapshot<Map<String, dynamic>> t1 =
          await _firestore.doc("/projects/$useUid").get();
      if (t1.exists && t1.data() != null) {
        applications.add(Map<String, dynamic>.from(t1.data()!));
      }
      log("In function: $applications");
      return applications;
    } catch (e) {
      showSnackBar(context, e.toString());
      return [];
    }
  }
}
