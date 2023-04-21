import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_hive/controllers/input_controllers.dart';
import 'package:project_hive/globals/appBar.dart';
import 'package:project_hive/globals/widgets.dart';
import 'package:project_hive/models/company_employee_model.dart';
import 'package:project_hive/models/independent_user.dart';
import 'package:project_hive/models/institute_faculty_model.dart';
import 'package:project_hive/models/student_model.dart';
import 'package:project_hive/services/authentication.dart';
import 'package:uuid/uuid.dart';

final _inputCtr = Get.put(userInputController());
final authObj = Authentication();

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Sign Up',
                style: TextStyle(fontSize: 36),
              ),
              FilledButton(
                  onPressed: () {
                    Get.toNamed('/signInPage');
                  },
                  child: Text('Sign in instead')),
              const SizedBox(height: 25),
              //sign up form
              formFieldRow(
                useController: _inputCtr.accountTypeCtr,
                useText:
                    'Account Type [students, companyEmployee, instituteFaculty, independentUser] :',
              ),
              formFieldRow(
                useController: _inputCtr.genderCtr,
                useText: 'Gender [male/ female]:',
              ),
              formFieldRow(
                useController: _inputCtr.usernameCtr,
                useText: 'Username:',
              ),
              formFieldRow(
                useController: _inputCtr.nameCtr,
                useText: 'Name:',
              ),
              formFieldRow(
                useController: _inputCtr.descriptionCtr,
                useText: 'Description:',
              ),
              formFieldRow(
                useController: _inputCtr.ageCtr,
                useText: 'Age:',
              ),
              formFieldRow(
                useController: _inputCtr.introLineCtr,
                useText: 'Intro Line:',
              ),
              formFieldRow(
                useController: _inputCtr.locationCtr,
                useText: 'Location:',
              ),
              formFieldRow(
                useController: _inputCtr.phoneNumberCtr,
                useText: 'Phone Number:',
              ),
              formFieldRow(
                useController: _inputCtr.emailidCtr,
                useText: 'Email Id:',
              ),
              formFieldRow(
                useController: _inputCtr.passwordCtr,
                useText: 'Password:',
              ),
              formFieldRow(
                useController: _inputCtr.linksCtr,
                useText: 'My Links [Linkedin/ Portfolios/ Resume...]',
              ),
              formFieldRow(
                useController: _inputCtr.educationCtr,
                useText: 'My Education:',
              ),
              formFieldRow(
                useController: _inputCtr.interestsCtr,
                useText: 'My Interests:',
              ),
              formFieldRow(
                useController: _inputCtr.experienceCtr,
                useText: 'My Experience',
              ),
              formFieldRow(
                useController: _inputCtr.companyNameCtr,
                useText: 'Company Name: ',
              ),
              formFieldRow(
                useController: _inputCtr.aboutCompanyCtr,
                useText: 'About Company:',
              ),
              formFieldRow(
                useController: _inputCtr.roleCtr,
                useText: 'My Role/ Job:',
              ),
              formFieldRow(
                useController: _inputCtr.instituteCtr,
                useText: 'Institute Name:',
              ),
              formFieldRow(
                useController: _inputCtr.positionCtr,
                useText: 'My Position:',
              ),
              formFieldRow(
                useController: _inputCtr.aboutInstituteCtr,
                useText: 'About Institute:',
              ),
              FilledButton(
                onPressed: () async {
                  //final data = snapshot.data;
                  if (_inputCtr.accountTypeCtr.text == 'students') {
                    final useStudent = StudentModel(
                      age: int.parse(_inputCtr.ageCtr.text),
                      emailid: _inputCtr.emailidCtr.text,
                      introLine: _inputCtr.introLineCtr.text,
                      name: _inputCtr.nameCtr.text,
                      username: _inputCtr.usernameCtr.text,
                      description: _inputCtr.descriptionCtr.text,
                      location: _inputCtr.locationCtr.text,
                      links: ['${_inputCtr.linksCtr.text}'],
                      interests: ['${_inputCtr.interestsCtr.text}'],
                      phoneNumber: _inputCtr.phoneNumberCtr.text,
                      experience: _inputCtr.experienceCtr.text,
                      education: _inputCtr.educationCtr.text,
                      uid: Uuid().v4(),
                      accountType: 'students',
                      //profile photo, idcard
                      // idCard: snapshot.data?['idCard'],// please update
                      // profilePhoto: snapshot.data?['profilePhoto'],//please update
                      // accountType: snapshot.data?['accountType'],
                      // myApplications: snapshot.data?['myApplications'],
                      // uid: snapshot.data?['uid'],
                    );
                    await authObj.signUpWithEmail(
                        email: _inputCtr.emailidCtr.text,
                        password: _inputCtr.passwordCtr.text,
                        context: context,
                        student: useStudent);
                  } else if (_inputCtr.accountTypeCtr.text ==
                      'companyEmployee') {
                    final useCompanyEmployee = CompanyEmployeeModel(
                      age: int.parse(_inputCtr.ageCtr.text),
                      emailid: _inputCtr.emailidCtr.text,
                      introLine: _inputCtr.introLineCtr.text,
                      name: _inputCtr.nameCtr.text,
                      username: _inputCtr.usernameCtr.text,
                      description: _inputCtr.descriptionCtr.text,
                      location: _inputCtr.locationCtr.text,
                      links: ['${_inputCtr.linksCtr.text}'],
                      phoneNumber: _inputCtr.phoneNumberCtr.text,
                      uid: Uuid().v4(),
                      companyName: _inputCtr.companyNameCtr.text,
                      aboutCompany: _inputCtr.aboutCompanyCtr.text,
                      role: _inputCtr.roleCtr.text,
                      accountType: 'companyEmployee',
                      //profile photo, idcard
                      // idCard: snapshot.data?['idCard'],// please update
                      // profilePhoto: snapshot.data?['profilePhoto'],//please update
                      // accountType: snapshot.data?['accountType'],
                      // myApplications: snapshot.data?['myApplications'],
                      // uid: snapshot.data?['uid'],
                    );
                    await authObj.signUpWithEmail(
                        email: _inputCtr.emailidCtr.text,
                        password: _inputCtr.passwordCtr.text,
                        context: context,
                        companyEmployee: useCompanyEmployee);
                  } else if (_inputCtr.accountTypeCtr.text ==
                      'instituteFaculty') {
                    final useInstituteFaculty = InstituteFacultyModel(
                      age: int.parse(_inputCtr.ageCtr.text),
                      emailid: _inputCtr.emailidCtr.text,
                      introLine: _inputCtr.introLineCtr.text,
                      name: _inputCtr.nameCtr.text,
                      username: _inputCtr.usernameCtr.text,
                      description: _inputCtr.descriptionCtr.text,
                      location: _inputCtr.locationCtr.text,
                      links: ['${_inputCtr.linksCtr.text}'],
                      phoneNumber: _inputCtr.phoneNumberCtr.text,
                      uid: Uuid().v4(),
                      institute: _inputCtr.instituteCtr.text,
                      aboutInstitute: _inputCtr.aboutInstituteCtr.text,
                      position: _inputCtr.positionCtr.text,
                      accountType: 'instituteFaculty',
                      //profile photo, idcard
                      // idCard: snapshot.data?['idCard'],// please update
                      // profilePhoto: snapshot.data?['profilePhoto'],//please update
                      // accountType: snapshot.data?['accountType'],
                      // myApplications: snapshot.data?['myApplications'],
                      // uid: snapshot.data?['uid'],
                    );
                    await authObj.signUpWithEmail(
                        email: _inputCtr.emailidCtr.text,
                        password: _inputCtr.passwordCtr.text,
                        context: context,
                        institueFaculty: useInstituteFaculty);
                  } else if (_inputCtr.accountTypeCtr.text ==
                      'independentUser') {
                    final useIndependentUser = IndependentUserModel(
                      age: int.parse(_inputCtr.ageCtr.text),
                      emailid: _inputCtr.emailidCtr.text,
                      introLine: _inputCtr.introLineCtr.text,
                      name: _inputCtr.nameCtr.text,
                      username: _inputCtr.usernameCtr.text,
                      description: _inputCtr.descriptionCtr.text,
                      location: _inputCtr.locationCtr.text,
                      links: ['${_inputCtr.linksCtr.text}'],
                      phoneNumber: _inputCtr.phoneNumberCtr.text,
                      uid: Uuid().v4(),
                      accountType: 'independentUser',
                      //profile photo, idcard
                      // idCard: snapshot.data?['idCard'],// please update
                      // profilePhoto: snapshot.data?['profilePhoto'],//please update
                      // accountType: snapshot.data?['accountType'],
                      // myApplications: snapshot.data?['myApplications'],
                      // uid: snapshot.data?['uid'],
                    );
                    await authObj.signUpWithEmail(
                        email: _inputCtr.emailidCtr.text,
                        password: _inputCtr.passwordCtr.text,
                        context: context,
                        independentUser: useIndependentUser);
                  } else {
                    showSnackBar(context,
                        'Invalid accountType selected, please correct the field');
                  }
                  Get.toNamed('/verifyEmailPage');
                },
                child: Text('Create Account'),
              ),
            ]),
      ),
    );
  }
}
