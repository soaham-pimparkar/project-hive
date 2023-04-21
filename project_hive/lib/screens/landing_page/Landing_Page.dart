import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:project_hive/globals/appBar.dart';
import 'package:project_hive/globals/drawer.dart';
import 'package:project_hive/screens/themes/app_colors.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        drawer: CustomDrawer(),
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Screen1(),
              Screen2(),
              Screen3(),
              Screen4(),
            ],
          ),
        ));
  }
}

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    double heightMax = MediaQuery.of(context).size.height;
    double widthMax = MediaQuery.of(context).size.width;
    return Container(
      height: heightMax,
      width: widthMax,
      decoration: BoxDecoration(color: AppColors.appBg),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: heightMax,
            width: widthMax * 0.5,
            decoration: BoxDecoration(color: Colors.transparent),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Project Hive",
                  style: TextStyle(
                    color: AppColors.textColorLight,
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Connections that lead to innovations",
                  style: TextStyle(
                    color: AppColors.appYellow,
                    fontSize: 40,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            AppColors.appYellow),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: AppColors.appYellow),
                          ),
                        ),
                      ),
                      child: Text(
                        "Login",
                        style: TextStyle(color: AppColors.darkColor),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.transparent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: AppColors.appYellow),
                            ),
                          )),
                      child: Text(
                        "Explore",
                        style: TextStyle(color: AppColors.textColorLight),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: heightMax,
            width: widthMax * 0.5,
            decoration: const BoxDecoration(color: Colors.transparent),
            child: Image.asset(r"assets/images/Asset1.png"),
          ),
        ],
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    double heightMax = MediaQuery.of(context).size.height;
    double widthMax = MediaQuery.of(context).size.width;
    return Container(
      height: heightMax,
      width: widthMax,
      decoration: BoxDecoration(color: AppColors.appBg),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              height: heightMax,
              width: widthMax / 2.04,
              decoration: const BoxDecoration(color: Colors.transparent),
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    widthMax * 0.5 * 0.5, heightMax * 0.2, 0, 0),
                child: Text(
                  "Who are we?",
                  style: TextStyle(
                    color: AppColors.textColorLight,
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
          Container(
            height: heightMax * 0.7,
            width: 5,
            decoration: BoxDecoration(
                color: AppColors.appYellow,
                borderRadius: BorderRadius.circular(2.5)),
          ),
          Container(
            height: heightMax,
            width: widthMax / 2.04,
            decoration: const BoxDecoration(color: Colors.transparent),
            child: Center(
              child: Container(
                width: (widthMax / 2.04) * 0.75,
                child: Text(
                  """Project Hive is a student-focused startup that connects talented individuals with companies and other organizations.
                          
                          Our platform provides a simple and efficient way for students to discover exciting opportunities and build meaningful connections in their fields of interest. 
                          
                          With Project Hive, students can unlock their full potential and take the first step towards achieving their career goals.""",
                  style: TextStyle(
                    color: AppColors.textColorLight,
                    fontSize: 25,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    double heightMax = MediaQuery.of(context).size.height;
    double widthMax = MediaQuery.of(context).size.width;
    return Container(
      height: heightMax,
      width: widthMax,
      decoration: BoxDecoration(color: AppColors.appBg),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "About Us",
                style: TextStyle(
                  color: AppColors.textColorLight,
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColors.appYellow,
                    borderRadius: BorderRadius.circular(20)),
                width: widthMax * 0.75,
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    """Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.


It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accidentLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.


It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident""",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                child: IconButton(
                    onPressed: () {},
                    icon: Image.asset(r"assets/images/Insta.jpg")),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.mail_rounded,
                    color: AppColors.textColorLight,
                    size: 35,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.call,
                    color: AppColors.textColorLight,
                    size: 35,
                  ))
            ],
          )
        ],
      ),
    );
  }
}

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    double heightMax = MediaQuery.of(context).size.height;
    double widthMax = MediaQuery.of(context).size.width;
    return Container(
      height: heightMax,
      width: widthMax,
      decoration: BoxDecoration(color: AppColors.appBg),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Text("Contact Us",
                      style: TextStyle(
                        color: AppColors.textColorLight,
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                      )),
                )
              ],
            ),
            SizedBox(height: heightMax * 0.1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.appYellow,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: widthMax * 0.25,
                  height: heightMax * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              hintText: 'Name',
                            ),
                          ),
                          const TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              hintText: 'Mobile Number',
                            ),
                          ),
                          const TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              hintText: 'Email',
                            ),
                          ),
                          Center(
                            child: Container(
                              height: heightMax * 0.05,
                              width: widthMax * 0.15,
                              decoration: BoxDecoration(
                                  color: AppColors.appBg,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                "Contact Us",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColors.textColorLight,
                                    fontSize: 25),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.appYellow,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: widthMax * 0.55,
                  height: heightMax * 0.5,
                  child: const Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          hintText: 'Subject',
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          hintText: 'Query',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
