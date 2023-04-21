import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_hive/controllers/input_controllers.dart';
import 'package:project_hive/globals/widgets.dart';
import 'package:project_hive/models/project_model.dart';
import 'package:project_hive/services/authentication.dart';
import 'package:project_hive/services/database.dart';
import 'package:uuid/uuid.dart';

database databaseObj = database();
Authentication authObj = Authentication();
final _inputCtr = Get.put(userInputController());

class myProfileView extends StatelessWidget {
  const myProfileView({super.key});

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
                            isReadOnly: true,
                            initialText: snapshot.data?['username']),
                        formFieldRow(
                            useController: _inputCtr.nameCtr,
                            useText: 'Name:',
                            isReadOnly: true,
                            initialText: snapshot.data?['name']),
                        formFieldRow(
                            useController: _inputCtr.descriptionCtr,
                            useText: 'Description:',
                            isReadOnly: true,
                            initialText: snapshot.data?['description']),
                        formFieldRow(
                            useController: _inputCtr.ageCtr,
                            useText: 'Age:',
                            isReadOnly: true,
                            initialText: snapshot.data?['age']),
                        formFieldRow(
                            useController: _inputCtr.introLineCtr,
                            useText: 'Intro Line:',
                            isReadOnly: true,
                            initialText: snapshot.data?['introLine']),
                        formFieldRow(
                            useController: _inputCtr.locationCtr,
                            useText: 'Location:',
                            isReadOnly: true,
                            initialText: snapshot.data?['location']),
                        formFieldRow(
                            useController: _inputCtr.phoneNumberCtr,
                            useText: 'Phone Number:',
                            isReadOnly: true,
                            initialText: snapshot.data?['phoneNumber']),
                        formFieldRow(
                            useController: _inputCtr.emailidCtr,
                            useText: 'Email Id:',
                            isReadOnly: true,
                            initialText: snapshot.data?['emailid']),
                        formFieldRow(
                            useController: _inputCtr.linksCtr,
                            useText:
                                'My Links [Linkedin/ Portfolios/ Resume...]',
                            isReadOnly: true,
                            initialText: snapshot.data?['links']),
                        formFieldRow(
                            useController: _inputCtr.educationCtr,
                            useText: 'My Education:',
                            isReadOnly: true,
                            initialText: snapshot.data?['education']),
                        formFieldRow(
                            useController: _inputCtr.interestsCtr,
                            useText: 'My Interests:',
                            isReadOnly: true,
                            initialText: snapshot.data?['interests']),
                        formFieldRow(
                            useController: _inputCtr.experienceCtr,
                            useText: 'My Experience',
                            isReadOnly: true,
                            initialText: snapshot.data?['experience']),
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
                            isReadOnly: true,
                            initialText: snapshot.data?['username']),
                        formFieldRow(
                            useController: _inputCtr.nameCtr,
                            useText: 'Name:',
                            isReadOnly: true,
                            initialText: snapshot.data?['name']),
                        formFieldRow(
                            useController: _inputCtr.descriptionCtr,
                            useText: 'Description:',
                            isReadOnly: true,
                            initialText: snapshot.data?['description']),
                        formFieldRow(
                            useController: _inputCtr.ageCtr,
                            useText: 'Age:',
                            isReadOnly: true,
                            initialText: snapshot.data?['age']),
                        formFieldRow(
                            useController: _inputCtr.introLineCtr,
                            useText: 'Intro Line:',
                            isReadOnly: true,
                            initialText: snapshot.data?['introLine']),
                        formFieldRow(
                            useController: _inputCtr.locationCtr,
                            useText: 'Location:',
                            isReadOnly: true,
                            initialText: snapshot.data?['location']),
                        formFieldRow(
                            useController: _inputCtr.phoneNumberCtr,
                            useText: 'Phone Number:',
                            isReadOnly: true,
                            initialText: snapshot.data?['phoneNumber']),
                        formFieldRow(
                            useController: _inputCtr.emailidCtr,
                            useText: 'Email Id:',
                            isReadOnly: true,
                            initialText: snapshot.data?['emailid']),
                        formFieldRow(
                            useController: _inputCtr.linksCtr,
                            useText:
                                'My Links [Linkedin/ Portfolios/ Resume...]',
                            isReadOnly: true,
                            initialText: snapshot.data?['links']),
                        formFieldRow(
                            useController: _inputCtr.companyNameCtr,
                            useText: 'My Company:',
                            isReadOnly: true,
                            initialText: snapshot.data?['companyName']),
                        formFieldRow(
                            useController: _inputCtr.aboutCompanyCtr,
                            useText: 'About Company:',
                            isReadOnly: true,
                            initialText: snapshot.data?['aboutCompany']),
                        formFieldRow(
                            useController: _inputCtr.roleCtr,
                            useText: 'My Role (Position in company)',
                            isReadOnly: true,
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
                            isReadOnly: true,
                            initialText: snapshot.data?['username']),
                        formFieldRow(
                            useController: _inputCtr.nameCtr,
                            useText: 'Name:',
                            isReadOnly: true,
                            initialText: snapshot.data?['name']),
                        formFieldRow(
                            useController: _inputCtr.descriptionCtr,
                            useText: 'Description:',
                            isReadOnly: true,
                            initialText: snapshot.data?['description']),
                        formFieldRow(
                            useController: _inputCtr.ageCtr,
                            useText: 'Age:',
                            isReadOnly: true,
                            initialText: snapshot.data?['age']),
                        formFieldRow(
                            useController: _inputCtr.introLineCtr,
                            useText: 'Intro Line:',
                            isReadOnly: true,
                            initialText: snapshot.data?['introLine']),
                        formFieldRow(
                            useController: _inputCtr.locationCtr,
                            useText: 'Location:',
                            isReadOnly: true,
                            initialText: snapshot.data?['location']),
                        formFieldRow(
                            useController: _inputCtr.phoneNumberCtr,
                            useText: 'Phone Number:',
                            isReadOnly: true,
                            initialText: snapshot.data?['phoneNumber']),
                        formFieldRow(
                            useController: _inputCtr.emailidCtr,
                            useText: 'Email Id:',
                            isReadOnly: true,
                            initialText: snapshot.data?['emailid']),
                        formFieldRow(
                            useController: _inputCtr.linksCtr,
                            useText:
                                'My Links [Linkedin/ Portfolios/ Resume...]',
                            isReadOnly: true,
                            initialText: snapshot.data?['links']),
                        formFieldRow(
                            useController: _inputCtr.instituteCtr,
                            useText: 'My Institute:',
                            isReadOnly: true,
                            initialText: snapshot.data?['institute']),
                        formFieldRow(
                            useController: _inputCtr.aboutCompanyCtr,
                            useText: 'About Company:',
                            isReadOnly: true,
                            initialText: snapshot.data?['aboutCompany']),
                        formFieldRow(
                            useController: _inputCtr.positionCtr,
                            useText: 'My Position:',
                            isReadOnly: true,
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
                            isReadOnly: true,
                            initialText: snapshot.data?['username']),
                        formFieldRow(
                            useController: _inputCtr.nameCtr,
                            useText: 'Name:',
                            isReadOnly: true,
                            initialText: snapshot.data?['name']),
                        formFieldRow(
                            useController: _inputCtr.descriptionCtr,
                            useText: 'Description:',
                            isReadOnly: true,
                            initialText: snapshot.data?['description']),
                        formFieldRow(
                            useController: _inputCtr.ageCtr,
                            useText: 'Age:',
                            isReadOnly: true,
                            initialText: snapshot.data?['age']),
                        formFieldRow(
                            useController: _inputCtr.introLineCtr,
                            useText: 'Intro Line:',
                            isReadOnly: true,
                            initialText: snapshot.data?['introLine']),
                        formFieldRow(
                            useController: _inputCtr.locationCtr,
                            useText: 'Location:',
                            isReadOnly: true,
                            initialText: snapshot.data?['location']),
                        formFieldRow(
                            useController: _inputCtr.phoneNumberCtr,
                            useText: 'Phone Number:',
                            isReadOnly: true,
                            initialText: snapshot.data?['phoneNumber']),
                        formFieldRow(
                            useController: _inputCtr.emailidCtr,
                            useText: 'Email Id:',
                            isReadOnly: true,
                            initialText: snapshot.data?['emailid']),
                        formFieldRow(
                            useController: _inputCtr.linksCtr,
                            useText:
                                'My Links [Linkedin/ Portfolios/ Resume...]',
                            isReadOnly: true,
                            initialText: snapshot.data?['links']),
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
            //button
            FilledButton(
                onPressed: () {
                  //Get.toNamed('editProfile');//also pass values
                },
                child: Text('Edit Profile'))
          ],
        ),
      ),
    );
  }
}
