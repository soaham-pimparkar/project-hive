import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_hive/models/project_model.dart';

import '../../../controllers/browse_projects_controller.dart';

class ProjectView extends StatelessWidget {
  final BrowseProjectsPageController browseProjectsPageController = Get.find();
  final ProjectModel project;
  ProjectView({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logo'),
        actions: [
          TextButton(onPressed: () {}, child: const Text('Browse Projects')),
          IconButton(onPressed: () {}, icon: const Icon(Icons.person))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              project.title != ''
                  ? Text(
                      project.title,
                      style: Theme.of(context).textTheme.headlineLarge,
                    )
                  : const SizedBox(),
              project.projectType != ''
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Project Type:'),
                        SizedBox(
                          width: size.width * 0.05,
                        ),
                        Text(
                          project.projectType,
                        ),
                      ],
                    )
                  : const SizedBox(),
              project.projectDetails != ''
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Details:'),
                        SizedBox(
                          width: size.width * 0.05,
                        ),
                        Text(
                          project.projectDetails!,
                        ),
                      ],
                    )
                  : const SizedBox(),
              project.companyDetails != ''
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Company Details:'),
                        SizedBox(
                          width: size.width * 0.05,
                        ),
                        Text(
                          project.companyDetails,
                        ),
                      ],
                    )
                  : const SizedBox(),
              project.keywords.isNotEmpty
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('Keywords:'),
                        SizedBox(
                          width: size.width * 0.05,
                        ),
                        SizedBox(
                          width: size.width * 0.5,
                          child: GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 0,
                              crossAxisSpacing: 0,
                              childAspectRatio: 8,
                            ),
                            itemBuilder: (context, index) => Center(
                                child: Container(
                              width: size.width * 0.1,
                              height: size.height * 0.05,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Theme.of(context).secondaryHeaderColor,
                              ),
                              child: Center(
                                child: Text(
                                  project.keywords[index],
                                ),
                              ),
                            )),
                            itemCount: project.keywords.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                          ),
                        )
                      ],
                    )
                  : const SizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Deadline:'),
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  SizedBox(
                    width: size.width * 0.3,
                    child: CalendarDatePicker(
                      initialDate: project.deadline!,
                      firstDate: project.deadline!,
                      lastDate: project.deadline!,
                      onDateChanged: (value) {},
                    ),
                  ),
                ],
              ),
              project.minTeamSize != 0 &&
                      project.maxTeamSize != 0 &&
                      project.minTeamSize != null &&
                      project.maxTeamSize != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('Team Size:'),
                        SizedBox(
                          width: size.width * 0.05,
                        ),
                        Expanded(
                          child: Text('${project.minTeamSize} - ${project.maxTeamSize}'),
                        )
                      ],
                    )
                  : const SizedBox(),
              project.mode != ''
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Mode:'),
                        SizedBox(
                          width: size.width * 0.05,
                        ),
                        Text(
                          project.mode!,
                        ),
                      ],
                    )
                  : const SizedBox(),
              project.prerequisites != ''
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Prerequisites:'),
                        SizedBox(
                          width: size.width * 0.05,
                        ),
                        Text(
                          project.prerequisites!,
                        ),
                      ],
                    )
                  : const SizedBox(),
              project.responsibilities != ''
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Responsibilities:'),
                        SizedBox(
                          width: size.width * 0.05,
                        ),
                        Text(
                          project.responsibilities!,
                        ),
                      ],
                    )
                  : const SizedBox(),
              project.rewards != ''
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Rewards:'),
                        SizedBox(
                          width: size.width * 0.05,
                        ),
                        Text(
                          project.rewards,
                        ),
                      ],
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
