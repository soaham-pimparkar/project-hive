import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_hive/models/company_employee_model.dart';
import 'package:project_hive/models/student_model.dart';
import 'package:project_hive/services/authentication.dart';

class testPage extends StatelessWidget {
  final authObj = Authentication();
  testPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test Page')),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
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
              ],
            )
          ]),
    );
  }
}
