import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class userInputController extends GetxController {
  String? accountTypeCtr;
  String? genderCtr;
  final ageCtr = TextEditingController();
  final descriptionCtr = TextEditingController();
  final emailidCtr = TextEditingController();
  final introLineCtr = TextEditingController();
  final linksCtr = TextEditingController();
  final locationCtr = TextEditingController();
  final nameCtr = TextEditingController();
  final usernameCtr = TextEditingController();
  final phoneNumberCtr = TextEditingController();
}

class projectInputController extends GetxController{

  final projectDetailsCtr = TextEditingController();
  final projectTypeCtr = TextEditingController();
  final modeCtr = TextEditingController(); //is a dropdown, change later
  final titleCtr = TextEditingController();
  final keywordsCtr = TextEditingController();//is a list, make changes
  final locationCtr = TextEditingController();
  final companyDetailsCtr = TextEditingController();
  final prerequisitesCtr = TextEditingController();
  final responsibilitiesCtr = TextEditingController();
  //final uidCtr = TextEditingController();
  final rewardsCtr = TextEditingController();
  final deadlineCtr = TextEditingController();
  final minTeamSizeCtr = TextEditingController();
  final maxTeamSizeCtr = TextEditingController();
  //final ownerUidCtr = TextEditingController();
}