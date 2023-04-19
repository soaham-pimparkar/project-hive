import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_hive/globals/widgets.dart';
import 'package:project_hive/models/application_model.dart';
import 'package:project_hive/models/company_employee_model.dart';
import 'package:project_hive/models/independent_user.dart';
import 'package:project_hive/models/institute_faculty_model.dart';
import 'package:project_hive/models/project_model.dart';
import 'package:project_hive/models/student_model.dart';
import 'package:project_hive/services/authentication.dart';
//import 'package:uuid/uuid.dart';

final _auth = Authentication();

class database {
  //Authentication _auth = Authentication();
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

  Future<Map<String, dynamic>?> getUserData(
      {required BuildContext context}) async {
    String? accountType = await getAccountType(context: context);
    String? userUid = await _auth.getUserUid(context: context);
    Map<String, dynamic> result = {};
    try {
      DocumentSnapshot docSnap =
          await _firestore.doc("$accountType/$userUid").get();
      if (docSnap.exists) {
        result = docSnap.data() as Map<String, dynamic>;
        //print(result);
        return result;
      } else {
        //print('unable to fetch data');
        return {};
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

/*
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
*/
  Future<String> getAccountType({required BuildContext context}) async {
    try {
      String useUid = await _auth.getUserUid(context: context);
      final studentDocRef = _firestore.collection("students").doc(useUid);
      final companyDocRef =
          _firestore.collection("companyEmployee").doc(useUid);
      final instituteDocRef =
          _firestore.collection("instituteFaculty").doc(useUid);
      final independentDocRef =
          _firestore.collection("IndependentUser").doc(useUid);

      DocumentSnapshot studentDoc = await studentDocRef.get();
      DocumentSnapshot companyDoc = await companyDocRef.get();
      DocumentSnapshot instituteDoc = await instituteDocRef.get();
      DocumentSnapshot independentDoc = await independentDocRef.get();

      if (studentDoc.exists) {
        final data = studentDoc.data() as Map<String, dynamic>;
        return data['accountType'] ?? 'default';
      } else if (companyDoc.exists) {
        final data = companyDoc.data() as Map<String, dynamic>;
        return data['accountType'] ?? 'default';
      } else if (instituteDoc.exists) {
        final data = instituteDoc.data() as Map<String, dynamic>;
        return data['accountType'] ?? 'default';
      } else if (independentDoc.exists) {
        final data = independentDoc.data() as Map<String, dynamic>;
        return data['accountType'] ?? 'default';
      } else {
        return 'default';
      }
    } catch (e) {
      print(e);
      return 'default';
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
      print("In function: $applications");
      return applications;
    } catch (e) {
      showSnackBar(context, e.toString());
      return [];
    }
  }
}
