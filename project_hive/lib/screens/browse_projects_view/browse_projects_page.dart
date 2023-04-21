import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_hive/controllers/browse_projects_controller.dart';
import 'package:project_hive/globals/appBar.dart';

import 'widgets/browse_project_grid_tile.dart';
import 'widgets/filter_and_sort_bar.dart';

class BrowseProjectsPage extends StatelessWidget {
  final BrowseProjectsPageController browseProjectsPageController =
      Get.put(BrowseProjectsPageController());
  BrowseProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    browseProjectsPageController.getProjects();
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FilterAndSortBar(),
          Obx(
            () => browseProjectsPageController.projects.isEmpty
                ? const Center(child: Text('No projects to be shown.'))
                : Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemCount: browseProjectsPageController.projects.length,
                      itemBuilder: (context, index) {
                        return BrowseProjectsGridTile(
                          project: browseProjectsPageController.projects[index],
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
