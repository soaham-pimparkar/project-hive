import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_hive/controllers/browse_projects_controller.dart';

class FilterAndSortBar extends StatelessWidget {
  final TextEditingController filterController = TextEditingController();
  final BrowseProjectsPageController browseProjectsPageController = Get.find();
  FilterAndSortBar({super.key});

  void callFilterFunction() {
    final String filtersText = filterController.text;
    final List<String> filtersList = [];
    final List<String> temp = filtersText.toLowerCase().split(',');
    for (var element in temp) {
      element.trim();
      if (!(element == '' || element == ' ')) {
        filtersList.add(element);
      }
    }
    print(filtersList.toString());
    browseProjectsPageController.filterProjects(filtersList);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Enter comma seperated filters',
                prefixIcon: Icon(Icons.search),
              ),
              controller: filterController,
              onChanged: (value) => callFilterFunction(),
              onSubmitted: (value) => callFilterFunction(),
            ),
          ),
          IconButton.filled(
            onPressed: () => callFilterFunction(),
            icon: const Icon(Icons.filter_alt_rounded),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Sort'),
          ),
        ],
      ),
    );
  }
}
