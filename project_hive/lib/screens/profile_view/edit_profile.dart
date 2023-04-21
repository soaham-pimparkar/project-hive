import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_hive/controllers/input_controllers.dart';
import 'package:project_hive/globals/appBar.dart';
import 'package:project_hive/globals/widgets.dart';
import 'package:project_hive/models/student_model.dart';
import 'package:project_hive/services/authentication.dart';
import 'package:project_hive/services/database.dart';

database databaseObj = database();
Authentication authObj = Authentication();
final _inputCtr = Get.put(userInputController());

class editProfileView extends StatelessWidget {
  const editProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
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
                  if (snapshot.data == null) {
                    return Container();
                  }
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
                            initialText:
                                snapshot.data?['interests'].toString()),
                        formFieldRow(
                            useController: _inputCtr.experienceCtr,
                            useText: 'My Experience',
                            initialText: snapshot.data?['experience']),
                        const SizedBox(height: 20),
                        FilledButton(
                            onPressed: () async {
                              final data = snapshot.data;
                              final useStudent = StudentModel(
                                age: (_inputCtr.ageCtr.text.isEmpty)
                                    ? data!['age']
                                    : int.parse(_inputCtr.ageCtr.text),
                                emailid: snapshot.data?['emailid'],
                                introLine: _inputCtr.introLineCtr.text.isEmpty
                                    ? data!['introLine']
                                    : _inputCtr.introLineCtr.text,
                                name: _inputCtr.nameCtr.text.isEmpty
                                    ? data!['name']
                                    : _inputCtr.nameCtr.text,
                                username: _inputCtr.usernameCtr.text.isEmpty
                                    ? data!['username']
                                    : _inputCtr.usernameCtr.text,
                                description:
                                    _inputCtr.descriptionCtr.text.isEmpty
                                        ? data!['description']
                                        : _inputCtr.descriptionCtr.text,
                                location: _inputCtr.locationCtr.text.isEmpty
                                    ? data!['location']
                                    : _inputCtr.locationCtr.text,
                                links: _inputCtr.linksCtr.text.isEmpty
                                    ? data!['links']
                                    : [(_inputCtr.linksCtr.text)],
                                interests: _inputCtr.interestsCtr.text.isEmpty
                                    ? data!['interests']
                                    : [(_inputCtr.interestsCtr.text)],
                                phoneNumber:
                                    _inputCtr.phoneNumberCtr.text.isEmpty
                                        ? data!['phoneNumber']
                                        : _inputCtr.phoneNumberCtr.text,
                                experience: _inputCtr.experienceCtr.text.isEmpty
                                    ? data!['experience']
                                    : _inputCtr.experienceCtr.text,
                                education: _inputCtr.educationCtr.text.isEmpty
                                    ? data!['education']
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
                            child: const Text('Submit')),
                        const SizedBox(height: 20),
                        FilledButton(
                            onPressed: () {
                              Get.toNamed('myProfilePage');
                            },
                            child: const Text('Discard'))
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
                    return const Text('Invalid User type detected');
                  }
                } else {
                  return const Text('No data fetched');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
