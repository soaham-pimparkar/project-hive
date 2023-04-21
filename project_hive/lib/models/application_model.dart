
import 'dart:convert';

class ApplicationModel {
  String background;
  String? mode;
  String appeal;
  String? location;
  String uid;
  String extraComments;
  int? teamSize;
  //String ownerUid;
  String projectUid;
  List<Map<String, String>> members;

  ApplicationModel(
      {required this.appeal,
      required this.uid,
      required this.background,
      this.mode,
      this.location,
      required this.extraComments,
      this.teamSize,
      //required this.ownerUid,
      required this.projectUid,
      required this.members});

  Map<String, dynamic> toMap() {
    return {
      'background': background,
      'mode': mode,
      'appeal': appeal,
      'location': location,
      'uid': uid,
      'extraComments': extraComments,
      'teamSize': teamSize,
      //'ownerUid': ownerUid,
      'projectUid': projectUid,
      'members': members,
    };
  }

  factory ApplicationModel.fromMap(Map<String, dynamic> map) {
    return ApplicationModel(
      background: map['background'] ?? '',
      mode: map['mode'] ?? '',
      appeal: map['appeal'] ?? '',
      location: map['location'] ?? '',
      uid: map['uid'] ?? '',
      extraComments: map['extraComments'] ?? '',
      //ownerUid: map['ownerUid'] ?? '',
      projectUid: map['projectUid'] ?? '',
      members: map['members'] ?? [],
    );
  }

  String toJson() => jsonEncode(toMap());

  factory ApplicationModel.fromJson(String source) {
    return ApplicationModel.fromMap(json.decode(source));
  }
}
