import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_hive/controllers/input_controllers.dart';
import 'package:project_hive/globals/widgets.dart';
import 'package:project_hive/models/project_model.dart';
import 'package:project_hive/screens/create_project_view/create_project_no_access.dart';
import 'package:project_hive/services/authentication.dart';
import 'package:project_hive/services/database.dart';
import 'package:uuid/uuid.dart';

final _inputCtr = Get.put(projectInputController());

class CreateProjectView extends StatelessWidget {
  final authObj = Authentication();
  final databaseObj = database();
  CreateProjectView({super.key});

  @override
  Widget build(BuildContext context) {
    print('before if true called');
    if (true) {
      print('if true called, before returning scaffold');
      return Scaffold(
        appBar: AppBar(), //replace with default bar later
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Create New Project',
                style: TextStyle(fontSize: 36),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Type:'),
                  SizedBox(width: 25),
                  TextFormField(
                    controller: _inputCtr.projectTypeCtr,
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Title:'),
                  SizedBox(width: 25),
                  TextFormField(
                    controller: _inputCtr.titleCtr,
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Details:'),
                  SizedBox(width: 25),
                  TextFormField(
                    controller: _inputCtr.projectDetailsCtr,
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Company Details:'),
                  SizedBox(width: 25),
                  TextFormField(
                    controller: _inputCtr.companyDetailsCtr,
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Keywords:'),
                  SizedBox(width: 25),
                  TextFormField(
                    controller: _inputCtr.keywordsCtr,
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Days left for application:'),
                  SizedBox(width: 25),
                  TextFormField(
                    controller: _inputCtr.deadlineCtr,
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Minimum team size:'),
                  SizedBox(width: 25),
                  TextFormField(
                    controller: _inputCtr.minTeamSizeCtr,
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Maximum team size:'),
                  SizedBox(width: 25),
                  TextFormField(
                    controller: _inputCtr.maxTeamSizeCtr,
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Mode:'),
                  SizedBox(width: 25),
                  TextFormField(
                    controller: _inputCtr.modeCtr,
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('location:'),
                  SizedBox(width: 25),
                  TextFormField(
                    controller: _inputCtr.locationCtr,
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Prerequisites:'),
                  SizedBox(width: 25),
                  TextFormField(
                    controller: _inputCtr.prerequisitesCtr,
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Responsibilities:'),
                  SizedBox(width: 25),
                  TextFormField(
                    controller: _inputCtr.responsibilitiesCtr,
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Rewards:'),
                  SizedBox(width: 25),
                  TextFormField(
                    controller: _inputCtr.rewardsCtr,
                  ),
                ],
              ),
              SizedBox(height: 25),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      String useOwnerUid =
                          await authObj.getUserUid(context: context);
                      var useUid = Uuid().v4();
                      DateTime useDateTime = DateTime.now().add(Duration(
                          days: int.parse(_inputCtr.deadlineCtr.text)));
                      final useProject = ProjectModel(
                          projectType: _inputCtr.projectTypeCtr.text,
                          title: _inputCtr.titleCtr.text,
                          companyDetails: _inputCtr.companyDetailsCtr.text,
                          uid: useUid,
                          rewards: _inputCtr.rewardsCtr.text,
                          deadline: useDateTime,
                          ownerUid: useOwnerUid);
                      await databaseObj.createProjectRecord(
                          context: context, project: useProject);
                      showSnackBar(context, 'Project successfully created!');
                    } catch (e) {
                      showSnackBar(context, e.toString());
                    }
                  },
                  child: Text('Submit'))
            ],
          ),
        ),
      );
    } else {
      return CreateProjectNoAccessView();
    }
  }
}
