import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_hive/models/company_employee_model.dart';
import 'package:project_hive/models/project_model.dart';
import 'package:project_hive/models/student_model.dart';
import 'package:project_hive/screens/profile_view/profile.dart';
import 'package:project_hive/services/authentication.dart';
import 'package:project_hive/services/database.dart';
import 'package:uuid/uuid.dart';
import 'package:get/get.dart';

class testPage extends StatelessWidget {
  testPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authObj = Authentication();
    final databaseObj = database();
    return Scaffold(
      appBar: AppBar(title: Text('Test Page')),
      body: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FilledButton(
                    onPressed: () {
                      StudentModel useStudent = StudentModel(
                          age: 19,
                          emailid: "acechazegaming@gmail.com",
                          introLine: "I am the first user",
                          name: "ace",
                          username: "ace chaze",
                          gender: "male",
                          description: "I am an engineering student too",
                          links: ["www.youtube.com", "www.instagram.com"],
                          education: 'engineering');
                      authObj.signUpWithEmail(
                          email: "acechazegaming@gmail.com",
                          password: "inc2023",
                          context: context,
                          student: useStudent);
                    },
                    child: Text('Sign up student')),
                Spacer(),
                FilledButton(
                    onPressed: () {
                      CompanyEmployeeModel useCompanyEmployee =
                          CompanyEmployeeModel(
                              age: 19,
                              emailid:
                                  "acechazegamingasncsscbiuwfbivbciaebvierlnie@gmail.com",
                              introLine: "I am the first user",
                              name: "ace",
                              username: "ace chaze",
                              gender: "male",
                              description: "I am an engineering student too",
                              links: ["www.youtube.com", "www.instagram.com"],
                              role: 'ceo',
                              companyName: 'crs');
                      authObj.signUpWithEmail(
                          email:
                              "acechazegamingasncsscbiuwfbivbciaebvierlnie@gmail.com",
                          password: "inc2023",
                          context: context,
                          companyEmployee: useCompanyEmployee);
                    },
                    child: Text('Sign up companyEmployee')),
                Spacer(),
                FilledButton(
                    onPressed: () async {
                      var useUid = Uuid().v4();
                      ProjectModel useProject = ProjectModel(
                          projectType: 'project',
                          title: 'Test Project',
                          companyDetails: 'CRS',
                          rewards: 'Rs 101',
                          maxTeamSize: 4,
                          minTeamSize: 1,
                          uid: useUid,
                          keywords: [],
                          ownerUid: await authObj.getUserUid(
                              context:
                                  context), //implement error handling while final code
                          deadline:
                              DateTime.now().add(const Duration(days: 5)));
                      databaseObj.createProjectRecord(
                          context: context, project: useProject);
                    },
                    child: Text('create project')),
                Spacer(),
                // FilledButton(
                //     onPressed: () async {
                //       String? temp =
                //           await databaseObj.getAccountType(context: context);
                //       print(temp);
                //     },
                //     child: Text('get account type')),
                // Spacer(),
                FilledButton(
                    onPressed: () async {
                      await authObj.logInWithEmail(
                          email: 'acechazegaming@gmail.com',
                          password: 'inc2023',
                          context: context);
                    },
                    child: Text('log in')),
                Spacer(),
                // FilledButton(
                //     onPressed: () async {
                //       databaseObj.getUserData(context: context);
                //     },
                //     child: Text('get user data')),
                // Spacer(),
                FilledButton(
                    onPressed: () {
                      Get.to(profileView());
                    },
                    child: Text('log in')),
                Spacer(),
              ],
            )
          ]),
    );
  }
}
