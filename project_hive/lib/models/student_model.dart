import 'dart:convert';

class StudentModel {
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
  String? experience;
  List<String>? interests;
  String? education;
  List<String>? myApplications;
  String accountType;

  StudentModel({
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
    this.experience,
    this.interests,
    this.education,
    this.myApplications,
    this.accountType = 'student',
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
      'education': education,
      'interests': interests,
      'experience': experience,
      'myApplications': myApplications,
      'accountType' : accountType,
    };
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
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
      education: map['education'] ?? '',
      interests: map['interests'] ?? [],
      experience: map['experience'] ?? '',
      myApplications: map['myApplications'] ?? [],
      accountType: map['accountType'] ?? '',
    );
  }

  String toJson() => jsonEncode(toMap());

  factory StudentModel.fromJson(String source) {
    return StudentModel.fromMap(json.decode(source));
  }
}


//previous constuctor for student model:
/*StudentModel({
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