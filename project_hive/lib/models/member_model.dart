import 'dart:convert';

class MemberModel{
  String name;
  String? phoneNumber;
  String emailid;
  String? location;
  String uid;
  String profile;
  int? qualification;

  MemberModel({
    required this.emailid,
    required this.uid,
    required this.name,
    this.phoneNumber,
    this.location,
    required this.profile,
    this.qualification,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'emailid': emailid,
      'location': location,
      'uid': uid,
      'profile': profile,
      'qualification': qualification,
    };
  }

  factory MemberModel.fromMap(Map<String, dynamic> map) {
    return MemberModel(
      name: map['name'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      emailid: map['emailid'] ?? '',
      location: map['location'] ?? '',
      uid: map['uid'] ?? '',
      profile: map['profile'] ?? '',
    );
  }

  String toJson() => jsonEncode(toMap());

  factory MemberModel.fromJson(String source) {
    return MemberModel.fromMap(json.decode(source));
  }
}
