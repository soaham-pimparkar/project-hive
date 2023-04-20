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
  //idCard
  //profilePhoto
  final experienceCtr = TextEditingController();
  final interestsCtr = TextEditingController();
  final educationCtr = TextEditingController();
  //My applications/ projects
  final companyNameCtr = TextEditingController();
  final roleCtr = TextEditingController();
  final aboutCompanyCtr = TextEditingController();
  final instituteCtr = TextEditingController();
  final positionCtr = TextEditingController();
  final aboutInstituteCtr = TextEditingController();
}

class projectInputController extends GetxController {
  final projectDetailsCtr = TextEditingController();
  final projectTypeCtr = TextEditingController();
  final modeCtr = TextEditingController(); //is a dropdown, change later
  final titleCtr = TextEditingController();
  final keywordsCtr = TextEditingController(); //is a list, make changes
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

// class EventDateController extends GetxController {
//   var allEventTimes = [].obs;
//   var allDates = [].obs;
//   var currentDate = DateTime.now().obs;
//   var activeDates = <bool>[].obs;
//   RxInt newIndex = 0.obs;

//   @override
//   void onInit() {
//     fetchDates();
//     getSelectedDates();
//     eventDays();
//   }

//   ScheduleController() {
//     fetchDates();
//     getSelectedDates();
//     eventDays();
//     changeSelectedDate(newIndex);
//   }

//   void fetchDates() async {
//     allEventTimes = RxList([
//     ]);

//     currentDate = DateTime(2022, 3, allEventTimes[0].date) as Rx<DateTime>;
//   }

//   void eventDays() async {
//     print("object");

//     print("----------------------------------------------");
//     print("----------------------------------------------");
//     print("Unique Dates: $allDates");
//   }

//   void getSelectedDates() async {
//     int total = allEventTimes.length;
//     activeDates = RxList(List.generate(total, (index) => true));
//     activeDates[0] = false;
//   }

//   void changeSelectedDate(newIndex) {
//     print("This is the new Date index: $newIndex");
//     activeDates.fillRange(0, activeDates.length, true);
//     activeDates[newIndex] = false;
//     update(activeDates);
//   }
// }
