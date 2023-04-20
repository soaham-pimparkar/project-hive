import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectModel {
  String? projectDetails;
  String projectType;
  String? mode;
  String title;
  List<dynamic> keywords;
  String? location;
  String companyDetails;
  String? prerequisites;
  String? responsibilities;
  String uid;
  String rewards;
  DateTime? deadline;
  int? minTeamSize;
  int? maxTeamSize;
  String ownerUid;
  List<String>? receivedApplications;

  ProjectModel({
    required this.projectType,
    required this.title,
    required this.companyDetails,
    required this.uid,
    this.projectDetails,
    this.mode,
    required this.keywords,
    this.location,
    this.prerequisites,
    this.responsibilities,
    required this.rewards,
    required this.deadline,
    this.maxTeamSize,
    this.minTeamSize,
    required this.ownerUid,
    this.receivedApplications,
  });

  Map<String, dynamic> toMap() {
    return {
      'projectDetails': projectDetails,
      'projectType': projectType,
      'mode': mode,
      'title': title,
      'keywords': keywords,
      'location': location,
      'companyDetails': companyDetails,
      'prerequisites': prerequisites,
      'uid': uid,
      'responsibilities': responsibilities,
      'rewards': rewards,
      'deadline': deadline,
      'maxTeamSize': maxTeamSize,
      'minTeamSize': minTeamSize,
      'ownerUid': ownerUid,
      'receivedApplications': receivedApplications,
    };
  }

  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      projectDetails: map['projectDetails'] ?? '',
      projectType: map['projectType'] ?? '',
      mode: map['mode'] ?? '',
      title: map['title'] ?? '',
      keywords: map['keywords'] ?? [],
      location: map['location'] ?? '',
      companyDetails: map['companyDetails'] ?? '',
      prerequisites: map['prerequisites'] ?? '',
      responsibilities: map['responsibilities'] ?? '',
      uid: map['uid'] ?? '',
      rewards: map['rewards'] ?? '',
      deadline: (map['deadline'] as Timestamp).toDate() ?? DateTime.now(),
      ownerUid: map['ownerUid'] ?? '',
      receivedApplications: map['receivedApplications'] ?? [],
    );
  }

  String toJson() => jsonEncode(toMap());

  factory ProjectModel.fromJson(String source) {
    return ProjectModel.fromMap(json.decode(source));
  }
}
