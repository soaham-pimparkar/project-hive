import 'dart:convert';

class InstituteFacultyModel {
  int age;
  String? description;
  final String emailid;
  String? gender;
  String? idCard;
  String introLine;
  List<String>? links;
  String? location;
  String name;
  String? phoneNumber;
  String? profilePhoto;
  String? uid;
  String username;
  String institute;
  String position;
  String? aboutInstitute;
  List<String>? myProjects;
  String accountType;

  InstituteFacultyModel({
    required this.age,
    required this.emailid,
    required this.introLine,
    required this.name,
    this.uid,
    required this.username,
    this.description,
    this.gender,
    this.idCard,
    this.links,
    this.location,
    this.phoneNumber,
    this.profilePhoto,
    required this.institute,
    required this.position,
    this.aboutInstitute,
    this.myProjects,
    this.accountType = 'instituteFaculty',
  });

  Map<String, dynamic> toMap() {
    return {
      'age': age,
      'description': description,
      'emailid': emailid,
      'gender': gender,
      'idCard': idCard,
      'introLine': introLine,
      'links': links,
      'location': location,
      'name': name,
      'phoneNumber': phoneNumber,
      'uid': uid,
      'profilePhoto': profilePhoto,
      'username': username,
      'aboutInstitute': aboutInstitute,
      'position': position,
      'institute': institute,
      'myProjects': myProjects,
      'accountType' : accountType,
    };
  }

  factory InstituteFacultyModel.fromMap(Map<String, dynamic> map) {
    return InstituteFacultyModel(
      age: map['age'] ?? 0,
      description: map['description'] ?? '',
      emailid: map['emailid'] ?? '',
      gender: map['gender'] ?? '',
      idCard: map['idCard'] ?? '',
      introLine: map['introLine'] ?? '',
      links: map['links'] ?? [],
      location: map['location'] ?? '',
      name: map['name'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      profilePhoto: map['profilePhoto'] ?? '',
      uid: map['uid'] ?? '',
      username: map['username'] ?? '',
      aboutInstitute: map['aboutInstitute'] ?? '',
      position: map['position'] ?? '',
      institute: map['institute'] ?? '',
      myProjects: map['myProjects'] ?? [],
      accountType: map['accountType'] ?? '',
    );
  }

  String toJson() => jsonEncode(toMap());

  factory InstituteFacultyModel.fromJson(String source) {
    return InstituteFacultyModel.fromMap(json.decode(source));
  }
}


//previous constuctor for student model:
/*InstituteFacultyModel({
    required this.age,
    required this.emailid,
    required this.introLine,
    required this.name,
    required this.uid,
    required this.username,
    this.description,
    this.gender,
    this.idCard,
    this.links,
    this.location,
    this.phoneNumber,
    this.profilePhoto,
    //String? description,
    //String? gender,
    //String? idCard,
    //List<String>? links,
    //String? location,
    //String? phoneNumber,
    //String? profilePhoto,
  }){
    this.description = description ?? "null";
    this.gender = gender ?? " ";
    this.idCard = idCard ?? " ";
    this.links = links ?? [];
    this.location = location ?? " ";
    this.phoneNumber = phoneNumber ?? " ";
    this.profilePhoto = profilePhoto ?? " ";
  }
*/