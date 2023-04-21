import 'package:get/get.dart';
import 'package:project_hive/models/project_model.dart';
import 'package:project_hive/services/database.dart';

class BrowseProjectsPageController extends GetxController {
  var projects = <ProjectModel>[].obs;

  Future<List<ProjectModel>> getProjects() async {
    var list = database().readAllProjects();
    projects.value = await list;
    return list;
  }

  void filterProjects(List<String> filters) async {
    List<ProjectModel> filteredProjects = [];
    var allProjects = await getProjects();
    for (var element in allProjects) {
      if (element.keywords.isNotEmpty) {
        int count = 0;
        for (var filter in filters) {
          if (element.keywords.contains(filter)) {
            count++;
          }
        }
        if(count == filters.length) filteredProjects.add(element);
      }
    }
    projects.value = filteredProjects;
  }
}
