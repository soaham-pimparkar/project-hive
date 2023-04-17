import 'dart:convert';

class ApplicationModel {
  String? projectDetails;
  String projectType;
  String? mode;
  String title;
  List<String>? keywords;
  String? location;
  String companyDetails;
  String? prerequisites;
  String? responsibilities;
  String uid;
  String rewards;
  DateTime? deadline;
  int? teamSize;
  int? maxTeamSize;
  String ownerUid;
  String projectUid;

  ApplicationModel({
    required this.projectType,
    required this.title,
    required this.companyDetails,
    required this.uid,
    this.projectDetails,
    this.mode,
    this.keywords,
    this.location,
    this.prerequisites,
    this.responsibilities,
    required this.rewards,
    required this.deadline,
    this.maxTeamSize,
    this.teamSize,
    required this.ownerUid,
    required this.projectUid
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
      'teamSize': teamSize,
      'ownerUid': ownerUid,
      'projectUid': projectUid,
    };
  }

  factory ApplicationModel.fromMap(Map<String, dynamic> map) {
    return ApplicationModel(
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
      deadline: map['deadline'] ?? DateTime.now(),
      ownerUid: map['ownerUid'] ?? '',
      projectUid: map['projectUid'] ?? '',
    );
  }

  String toJson() => jsonEncode(toMap());

  factory ApplicationModel.fromJson(String source) {
    return ApplicationModel.fromMap(json.decode(source));
  }
}
