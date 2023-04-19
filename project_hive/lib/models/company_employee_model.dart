import 'dart:convert';

class CompanyEmployeeModel {
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
  String companyName;
  String role;
  String? aboutCompany;
  List<String>? myProjects;
  String accountType;

  CompanyEmployeeModel({
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
    this.aboutCompany,
    required this.companyName,
    required this.role,
    this.myProjects,
    this.accountType = 'companyEmployee',
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
      'companyName': companyName,
      'role': role,
      'aboutCompany': aboutCompany,
      'myProjects': myProjects,
      'accountType' : accountType,
    };
  }

  factory CompanyEmployeeModel.fromMap(Map<String, dynamic> map) {
    return CompanyEmployeeModel(
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
      companyName: map['companyName'] ?? '',
      aboutCompany: map['aboutCompany'] ?? '',
      role: map['role'] ?? '',
      myProjects: map['myProjects'] ?? [],
      accountType: map['accountType'] ?? '',
    );
  }

  String toJson() => jsonEncode(toMap());

  factory CompanyEmployeeModel.fromJson(String source) {
    return CompanyEmployeeModel.fromMap(json.decode(source));
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