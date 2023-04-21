import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_hive/controllers/input_controllers.dart';
import 'package:project_hive/globals/widgets.dart';
import 'package:project_hive/models/project_model.dart';
import 'package:project_hive/models/student_model.dart';
import 'package:project_hive/services/authentication.dart';
import 'package:project_hive/services/database.dart';
import 'package:uuid/uuid.dart';

database databaseObj = database();
Authentication authObj = Authentication();
final _inputCtr = Get.put(userInputController());

class editProfileView extends StatelessWidget {
  const editProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //title
            FutureBuilder(
              future: databaseObj.getUserData(context: context),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data?['accountType'] == 'students') {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        formFieldRow(
                            useController: _inputCtr.usernameCtr,
                            useText: 'Username:',
                            initialText: snapshot.data?['username']),
                        formFieldRow(
                            useController: _inputCtr.nameCtr,
                            useText: 'Name:',
                            initialText: snapshot.data?['name']),
                        formFieldRow(
                            useController: _inputCtr.descriptionCtr,
                            useText: 'Description:',
                            initialText: snapshot.data?['description']),
                        formFieldRow(
                            useController: _inputCtr.ageCtr,
                            useText: 'Age:',
                            initialText: snapshot.data?['age'].toString()),
                        formFieldRow(
                            useController: _inputCtr.introLineCtr,
                            useText: 'Intro Line:',
                            initialText: snapshot.data?['introLine']),
                        formFieldRow(
                            useController: _inputCtr.locationCtr,
                            useText: 'Location:',
                            initialText: snapshot.data?['location']),
                        formFieldRow(
                            useController: _inputCtr.phoneNumberCtr,
                            useText: 'Phone Number:',
                            initialText: snapshot.data?['phoneNumber']),
                        /*formFieldRow(
                            useController: _inputCtr.emailidCtr,
                            useText: 'Email Id:',
                            initialText: snapshot.data?['emailid']),*/
                        formFieldRow(
                            useController: _inputCtr.linksCtr,
                            useText:
                                'My Links [Linkedin/ Portfolios/ Resume...]',
                            initialText: snapshot.data?['links'].toString()),
                        formFieldRow(
                            useController: _inputCtr.educationCtr,
                            useText: 'My Education:',
                            initialText: snapshot.data?['education']),
                        formFieldRow(
                            useController: _inputCtr.interestsCtr,
                            useText: 'My Interests:',
                            initialText: snapshot.data?['interests']),
                        formFieldRow(
                            useController: _inputCtr.experienceCtr,
                            useText: 'My Experience',
                            initialText: snapshot.data?['experience']),
                        FilledButton(
                            onPressed: () {},
                            /*async {
                              final useStudent = StudentModel(
      age:( _inputCtr.ageCtr.text.isEmpty) ? snapshot.data?['age'] : _inputCtr.ageCtr.text,
      emailid: snapshot.data?['emailid'],
      introLine: _inputCtr.introLineCtr.text.isEmpty
        ? snapshot.data?['introLine']
        : _inputCtr.introLineCtr.text,
      name: _inputCtr.nameCtr.text.isEmpty
        ? snapshot.data?['name']
        : _inputCtr.nameCtr.text,
      username: _inputCtr.usernameCtr.text.isEmpty
        ? snapshot.data?['username']
        : _inputCtr.usernameCtr.text,
      description: _inputCtr.descriptionCtr.text.isEmpty
        ? snapshot.data?['description']
        : _inputCtr.descriptionCtr.text,
      location: _inputCtr.locationCtr.text.isEmpty
        ? snapshot.data?['location']
        : _inputCtr.locationCtr.text,
      links: _inputCtr.linksCtr.text.isEmpty
        ? snapshot.data?['links']
        : ['${_inputCtr.linksCtr.text}'],
      interests: _inputCtr.interestsCtr.text.isEmpty
        ? snapshot.data?['interests']
        : ['${_inputCtr.interestsCtr.text}'],
      phoneNumber: _inputCtr.phoneNumberCtr.text.isEmpty
        ? snapshot.data?['phoneNumber']
        : _inputCtr.phoneNumberCtr.text,
      experience: _inputCtr.experienceCtr.text.isEmpty
        ? snapshot.data?['experience']
        : _inputCtr.experienceCtr.text,
      education: _inputCtr.educationCtr.text.isEmpty
        ? snapshot.data?['education']
        : _inputCtr.educationCtr.text,
                                //profile photo, idcard
                                // idCard: snapshot.data?['idCard'],// please update
                                // profilePhoto: snapshot.data?['profilePhoto'],//please update
                                // accountType: snapshot.data?['accountType'],
                                // myApplications: snapshot.data?['myApplications'],
                                // uid: snapshot.data?['uid'],
                              );
                              await databaseObj.updateUserRecord(
                                  useUid: snapshot.data?['uid'],
                                  context: context,
                                  student: useStudent);
                              //Submit data to firebase
                            },
                            child: Text('Submit')),
                        FilledButton(
                            onPressed: () {
                              //Get.to('myProfileView');
                            },*/
                            child: Text('Discard'))
                      ],
                    );
                  } else if (snapshot.data?['accountType'] ==
                      'companyEmployee') {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        formFieldRow(
                            useController: _inputCtr.usernameCtr,
                            useText: 'Username:',
                            initialText: snapshot.data?['username']),
                        formFieldRow(
                            useController: _inputCtr.nameCtr,
                            useText: 'Name:',
                            initialText: snapshot.data?['name']),
                        formFieldRow(
                            useController: _inputCtr.descriptionCtr,
                            useText: 'Description:',
                            initialText: snapshot.data?['description']),
                        formFieldRow(
                            useController: _inputCtr.ageCtr,
                            useText: 'Age:',
                            initialText: snapshot.data?['age'].toString()),
                        formFieldRow(
                            useController: _inputCtr.introLineCtr,
                            useText: 'Intro Line:',
                            initialText: snapshot.data?['introLine']),
                        formFieldRow(
                            useController: _inputCtr.locationCtr,
                            useText: 'Location:',
                            initialText: snapshot.data?['location']),
                        formFieldRow(
                            useController: _inputCtr.phoneNumberCtr,
                            useText: 'Phone Number:',
                            initialText: snapshot.data?['phoneNumber']),
                        formFieldRow(
                            useController: _inputCtr.emailidCtr,
                            useText: 'Email Id:',
                            initialText: snapshot.data?['emailid']),
                        formFieldRow(
                            useController: _inputCtr.linksCtr,
                            useText:
                                'My Links [Linkedin/ Portfolios/ Resume...]',
                            initialText: snapshot.data?['links'].toString()),
                        formFieldRow(
                            useController: _inputCtr.companyNameCtr,
                            useText: 'My Company:',
                            initialText: snapshot.data?['companyName']),
                        formFieldRow(
                            useController: _inputCtr.aboutCompanyCtr,
                            useText: 'About Company:',
                            initialText: snapshot.data?['aboutCompany']),
                        formFieldRow(
                            useController: _inputCtr.roleCtr,
                            useText: 'My Role (Position in company)',
                            initialText: snapshot.data?['role']),
                      ],
                    );
                  } else if (snapshot.data?['accountType'] ==
                      'instituteFaculty') {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        formFieldRow(
                            useController: _inputCtr.usernameCtr,
                            useText: 'Username:',
                            initialText: snapshot.data?['username']),
                        formFieldRow(
                            useController: _inputCtr.nameCtr,
                            useText: 'Name:',
                            initialText: snapshot.data?['name']),
                        formFieldRow(
                            useController: _inputCtr.descriptionCtr,
                            useText: 'Description:',
                            initialText: snapshot.data?['description']),
                        formFieldRow(
                            useController: _inputCtr.ageCtr,
                            useText: 'Age:',
                            initialText: snapshot.data?['age'].toString()),
                        formFieldRow(
                            useController: _inputCtr.introLineCtr,
                            useText: 'Intro Line:',
                            initialText: snapshot.data?['introLine']),
                        formFieldRow(
                            useController: _inputCtr.locationCtr,
                            useText: 'Location:',
                            initialText: snapshot.data?['location']),
                        formFieldRow(
                            useController: _inputCtr.phoneNumberCtr,
                            useText: 'Phone Number:',
                            initialText: snapshot.data?['phoneNumber']),
                        formFieldRow(
                            useController: _inputCtr.emailidCtr,
                            useText: 'Email Id:',
                            initialText: snapshot.data?['emailid']),
                        formFieldRow(
                            useController: _inputCtr.linksCtr,
                            useText:
                                'My Links [Linkedin/ Portfolios/ Resume...]',
                            initialText: snapshot.data?['links'].toString()),
                        formFieldRow(
                            useController: _inputCtr.instituteCtr,
                            useText: 'My Institute:',
                            initialText: snapshot.data?['institute']),
                        formFieldRow(
                            useController: _inputCtr.aboutCompanyCtr,
                            useText: 'About Company:',
                            initialText: snapshot.data?['aboutCompany']),
                        formFieldRow(
                            useController: _inputCtr.positionCtr,
                            useText: 'My Position:',
                            initialText: snapshot.data?['position']),
                      ],
                    );
                  } else if (snapshot.data?['accountType'] ==
                      'independentUser') {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        formFieldRow(
                            useController: _inputCtr.usernameCtr,
                            useText: 'Username:',
                            initialText: snapshot.data?['username']),
                        formFieldRow(
                            useController: _inputCtr.nameCtr,
                            useText: 'Name:',
                            initialText: snapshot.data?['name']),
                        formFieldRow(
                            useController: _inputCtr.descriptionCtr,
                            useText: 'Description:',
                            initialText: snapshot.data?['description']),
                        formFieldRow(
                            useController: _inputCtr.ageCtr,
                            useText: 'Age:',
                            initialText: snapshot.data?['age'].toString()),
                        formFieldRow(
                            useController: _inputCtr.introLineCtr,
                            useText: 'Intro Line:',
                            initialText: snapshot.data?['introLine']),
                        formFieldRow(
                            useController: _inputCtr.locationCtr,
                            useText: 'Location:',
                            initialText: snapshot.data?['location']),
                        formFieldRow(
                            useController: _inputCtr.phoneNumberCtr,
                            useText: 'Phone Number:',
                            initialText: snapshot.data?['phoneNumber']),
                        formFieldRow(
                            useController: _inputCtr.emailidCtr,
                            useText: 'Email Id:',
                            initialText: snapshot.data?['emailid']),
                        formFieldRow(
                            useController: _inputCtr.linksCtr,
                            useText:
                                'My Links [Linkedin/ Portfolios/ Resume...]',
                            initialText: snapshot.data?['links'].toString()),
                      ],
                    );
                  } else {
                    return Text('Invalid User type detected');
                  }
                } else {
                  return Text('No data fetched');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
