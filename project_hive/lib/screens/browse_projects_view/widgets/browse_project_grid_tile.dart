import 'package:flutter/material.dart';
import 'package:project_hive/models/project_model.dart';

class BrowseProjectsGridTile extends StatelessWidget {
  final ProjectModel project;
  const BrowseProjectsGridTile({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Card(
        child: Column(
          children: [
            Text(project.title),
            Text(project.companyDetails),
            Text(
              project.keywords.toString().substring(
                    1,
                    project.keywords.toString().length - 1,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
