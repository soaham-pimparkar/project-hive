import 'package:flutter/material.dart';
import '../../services/database.dart';

class StudentProjectView extends StatelessWidget {
  final String uid;
  late final List<Map<dynamic, dynamic>> projects;
  final databaseObj = database();

  StudentProjectView({super.key, required this.uid});

  @override
  Widget build(BuildContext context) {
    print("In StudentProjectView");
    return FutureBuilder<List<Map<dynamic, dynamic>>>(
      future: databaseObj.readSelectedProjects(useUid: uid, context: context),
      builder: (context, snapshot) {
        print("In Builder");
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            print("Has Data");
            // Data has been fetched successfully
            return MaterialApp(
              title: 'Applied Project View',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: Scaffold(
                appBar: AppBar(
                  title: const Text("Applied Projects"),
                ),
                body: Center(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InfoPopup(
                                  info: snapshot.data![index],
                                ),
                              );
                            },
                          );
                        },
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Color.fromARGB(120, 31, 31, 31))),
                            child: Column(
                                // mainAxisAlignment: MainAxisAlignment.to,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    snapshot.data![index]["title"],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 20),
                                  CardItem(
                                      value:
                                          "${snapshot.data![index]["companyDetails"]}"),
                                ]),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          } else {
            // Data fetching failed
            return const Center(
              child: Text("Failed to fetch data."),
            );
          }
        } else {
          // Data is being fetched
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class InfoPopup extends StatelessWidget {
  final Map<dynamic, dynamic> info;
  const InfoPopup({super.key, required this.info});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Project Details"),
      content: SizedBox(
        height: 500,
        width: 500,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //KeyWords
              const Text("KeyWords: "),
              for (var key in info["keywords"])
                SizedBox(
                  width: 250,
                  height: 20,
                  child: ListTile(
                    // dense: true,
                    // horizontalTitleGap: 10,
                    leading: const CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 4,
                    ),
                    title: Text('$key'),
                  ),
                ),

              //Mode
              const SizedBox(height: 20),
              ListItem(
                  title1: "Mode:",
                  value: info["mode"] != Null ? "${info["mode"]}" : "Mixed"),

              //Company Details
              const SizedBox(height: 20),
              ListItem(title1: "Details: ", value: "${info["companyDetails"]}"),

              //Location
              const SizedBox(height: 20),
              ListItem(
                title1: "Location: ",
                value:
                    info["location"] != Null ? "${info["location"]}" : "Hybrid",
              ),

              //Rewards
              const SizedBox(height: 20),
              ListItem(
                title1: "Rewards: ",
                value: info["rewards"] != Null
                    ? "${info["rewards"]}"
                    : "Experience Only",
              ),

              //Pre Requisited
              const SizedBox(height: 20),
              ListItem(
                title1: "Pre-requisites: ",
                value: info["prerequisites"] != Null
                    ? "${info["prerequisites"]}"
                    : "None",
              ),

              //Time line
              const SizedBox(height: 20),
              ListItem(
                  title1: "Deadline: ",
                  value: info["deadline"].toDate().toLocal().toString()),

              //Time line
              const SizedBox(height: 20),
              ListItem(
                  title1: "Team Size: ",
                  value:
                      "${info["minTeamSize"] != Null ? info["minTeamSize"].toString() : 1} to ${info["maxTeamSize"] != Null ? info["maxTeamSize"].toString() : 1} members"),

              //Time line
              const SizedBox(height: 20),
              ListItem(
                title1: "Responsibilities: ",
                value: info["responsibilities"] != Null
                    ? info["responsibilities"].toString()
                    : "None",
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Close"),
        )
      ],
    );
  }
}

class ListItem extends StatelessWidget {
  final String title1;
  final String value;
  ListItem({super.key, required this.title1, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title1,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        // TextField(labelText:"${info["companyDetails"]}"),
        TextField(
          enabled: false,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: value,
            labelStyle: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}

class CardItem extends StatelessWidget {
  final String value;
  CardItem({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blueAccent,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Text(
            value,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
