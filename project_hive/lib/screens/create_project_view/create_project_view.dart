import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_hive/controllers/input_controllers.dart';
import 'package:project_hive/globals/widgets.dart';
import 'package:project_hive/models/project_model.dart';
// import 'package:project_hive/screens/create_project_view/create_project_no_access.dart';
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
              const Text(
                'Create New Project',
                style: TextStyle(fontSize: 36),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Type:'),
                  const SizedBox(width: 25),
                  Expanded(
                    child: TextFormField(
                      controller: _inputCtr.projectTypeCtr,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Title:'),
                  const SizedBox(width: 25),
                  Expanded(
                    child: TextFormField(
                      controller: _inputCtr.titleCtr,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Details:'),
                  const SizedBox(width: 25),
                  Expanded(
                    child: TextFormField(
                      controller: _inputCtr.projectDetailsCtr,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Company Details:'),
                  const SizedBox(width: 25),
                  Expanded(
                    child: TextFormField(
                      controller: _inputCtr.companyDetailsCtr,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Keywords:'),
                  const SizedBox(width: 25),
                  Expanded(
                    child: TextFormField(
                      controller: _inputCtr.keywordsCtr,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Days left for application:'),
                  const SizedBox(width: 25),
                  Expanded(
                    child: TextFormField(
                      controller: _inputCtr.deadlineCtr,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Minimum team size:'),
                  const SizedBox(width: 25),
                  Expanded(
                    child: TextFormField(
                      controller: _inputCtr.minTeamSizeCtr,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Maximum team size:'),
                  const SizedBox(width: 25),
                  Expanded(
                    child: TextFormField(
                      controller: _inputCtr.maxTeamSizeCtr,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Mode:'),
                  const SizedBox(width: 25),
                  Expanded(
                    child: TextFormField(
                      controller: _inputCtr.modeCtr,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('location:'),
                  const SizedBox(width: 25),
                  Expanded(
                    child: TextFormField(
                      controller: _inputCtr.locationCtr,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Prerequisites:'),
                  const SizedBox(width: 25),
                  Expanded(
                    child: TextFormField(
                      controller: _inputCtr.prerequisitesCtr,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Responsibilities:'),
                  const SizedBox(width: 25),
                  Expanded(
                    child: TextFormField(
                      controller: _inputCtr.responsibilitiesCtr,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Rewards:'),
                  const SizedBox(width: 25),
                  Expanded(
                    child: TextFormField(
                      controller: _inputCtr.rewardsCtr,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      String useOwnerUid =
                          await authObj.getUserUid(context: context);
                      var useUid = const Uuid().v4();
                      DateTime useDateTime = DateTime.now().add(Duration(
                          days: int.parse(_inputCtr.deadlineCtr.text)));
                      final useProject = ProjectModel(
                        projectType: _inputCtr.projectTypeCtr.text,
                        title: _inputCtr.titleCtr.text,
                        companyDetails: _inputCtr.companyDetailsCtr.text,
                        uid: useUid,
                        rewards: _inputCtr.rewardsCtr.text,
                        deadline: useDateTime,
                        ownerUid: useOwnerUid,
                        keywords: [],
                      );
                      await databaseObj.createProjectRecord(
                          context: context, project: useProject);
                      showSnackBar(context, 'Project successfully created!');
                    } catch (e) {
                      showSnackBar(context, e.toString());
                    }
                  },
                  child: const Text('Submit'))
            ],
          ),
        ),
      );
    }
    // else {
    //   return CreateProjectNoAccessView();
    // }
  }
}
