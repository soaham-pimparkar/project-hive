import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_hive/controllers/input_controllers.dart';
import '../../services/database.dart';

class TeamApplyPage extends StatelessWidget {
  final databaseObj = database();
  // late int teamSize;
  List<Step> steps = [];
  // final ApplicationController controller_ = Get.put(ApplicationController());
  // void initState() {
  //   teamSize = controller_.teamSize.value;
  // }
  @override
  Widget build(BuildContext context) {
    // ApplicationModel _application = ApplicationModel();
    ApplicationController controller_ = ApplicationController();
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Row(
              children: [
                const Text("Team Members: "),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    onEditingComplete: () {
                      print("Team Member Value updated");
                      controller_.teamSize.value =
                          int.parse(controller_.teamMemberSize.text);
                    },
                    onChanged: (value) {
                      controller_.teamSize.value = int.parse(value);
                    },
                    controller: controller_.teamMemberSize,
                  ),
                ),
              ],
            ),
            IndividualField(
                value: "Team Details: ", controller: controller_.teamDetails),
            IndividualField(value: "Appeal:", controller: controller_.appeal),
            IndividualField(
                value: "Queries: ", controller: controller_.queries),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: MyTabBar(
                  controller: controller_,
                )),
          ],
        ),
      ),
    );
  }
}

class IndividualField extends StatelessWidget {
  final String value;
  final TextEditingController controller;
  const IndividualField(
      {super.key, required this.value, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(value),
        Expanded(
          child: TextFormField(
            controller: controller,
          ),
        ),
      ],
    );
  }
}

class MyTabBar extends StatefulWidget {
  final ApplicationController controller;
  const MyTabBar({super.key, required this.controller});
  @override
  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar>
    with SingleTickerProviderStateMixin {
  late int tabs;
  @override
  void initState() {
    super.initState();
    tabs = widget.controller.teamSize.value;
  }

  @override
  Widget build(BuildContext context) {
    MemberDetailsController memberController = MemberDetailsController();
    TabController temp = TabController(length: tabs, vsync: this);
    void onSubmit() {
      Map<String, dynamic> t1 = memberController.toMap();
      if (!widget.controller.memberInfo.contains(t1)) {
        // print("Map inserted into memberlist");
        widget.controller.memberInfo.add(t1);
      }
      print(widget.controller.memberInfo);
    }

    temp.addListener(() => onSubmit());

    return DefaultTabController(
      length: tabs,
      child: Column(
        children: [
          Container(
            color: Colors.blue,
            child: TabBar(
              controller: temp,
              tabs: List<Tab>.generate(tabs, (int index) {
                return Tab(text: "Member: ${index + 1}");
              }).toList(),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: List<Widget>.generate(tabs, (int index) {
                return Column(
                  children: [
                    IndividualField(
                      controller: memberController.memberName,
                      value: "Name: ",
                    ),
                    IndividualField(
                      controller: memberController.email,
                      value: "Email: ",
                    ),
                    IndividualField(
                      controller: memberController.phoneNum,
                      value: "Phone: ",
                    ),
                    IndividualField(
                      controller: memberController.links,
                      value: "Link: ",
                    ),
                    IndividualField(
                      controller: memberController.education,
                      value: "Education: ",
                    ),
                    IndividualField(
                      controller: memberController.location,
                      value: "Location: ",
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
