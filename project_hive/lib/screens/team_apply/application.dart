import 'package:flutter/material.dart';
import 'package:project_hive/controllers/input_controllers.dart';
import '../../services/database.dart';

class TeamApplyPage extends StatelessWidget {
  final databaseObj = database();
  final String uid;
  TeamApplyPage({super.key, required this.uid});
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
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      print(controller_.toJson());
                    },
                    child: Text("Submit")),
                Spacer(),
                ElevatedButton(
                    onPressed: () {
                      databaseObj.makeNewApplication(
                          controller_.toMap(), context, uid);
                      print("Done");
                    },
                    child: Text("Test")),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MyTabBar extends StatefulWidget {
  final ApplicationController controller;
  const MyTabBar({super.key, required this.controller});
  @override
  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> with TickerProviderStateMixin {
  late int tabs;
  @override
  void initState() {
    super.initState();
    tabs = widget.controller.teamSize.value;
  }

  @override
  Widget build(BuildContext context) {
    MemberDetailsController memberController = MemberDetailsController();
    TabController tabController = TabController(length: tabs, vsync: this);
    String next = "Next";
    String prev = "Prev";
    void onSubmit() {
      Map<String, dynamic> t1 = memberController.toMap();
      bool unique = true;
      for (int i = 0; i < widget.controller.memberInfo.length; i++) {
        if (t1["phoneNum"] == widget.controller.memberInfo[i]["phoneNum"] &&
            t1["memberName"] == widget.controller.memberInfo[i]["memberName"] &&
            !memberController.isEmpty()) {
          unique = false;
          widget.controller.memberInfo[i] = t1;
          memberController.clear_();
          break;
        }
      }
      if (unique) {
        widget.controller.memberInfo.add(t1);
        memberController.clear_();
      }
      print(widget.controller.memberInfo);
    }

    return DefaultTabController(
      length: tabs,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue,
            ),
            child: TabBar(
              controller: tabController,
              onTap: (value) => onSubmit(),
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
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              if (tabController.index > 0) {
                                onSubmit();
                                tabController.index -= 1;
                              }
                            },
                            child: Text(prev)),
                        ElevatedButton(
                            onPressed: () {
                              onSubmit();
                              print(
                                  "Tabs: ${tabs}\nIndex: ${tabController.index}");
                              if (tabController.index + 1 < tabs) {
                                tabController.index += 1;
                              }
                            },
                            child: Text(next)),
                      ],
                    )
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
