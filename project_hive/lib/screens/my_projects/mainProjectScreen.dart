import 'package:flutter/material.dart';
import '../../services/database.dart';

class StudentProjectView extends StatelessWidget {
  late final List<Map<dynamic, dynamic>> projects;
  final databaseObj = database();

  @override
  Widget build(BuildContext context) {
    print("In StudentProjectView");
    return FutureBuilder<List<Map<dynamic, dynamic>>>(
      future: databaseObj.readSelectedProjects(
          useUid: "s2vRXXzhYmRnlppitIrsammvMhg2", context: context),
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
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Center(
                              child: Text(
                                // "Not here",
                                snapshot.data![index]["title"],
                                // projects[index]["companyDetails"],
                                textAlign: TextAlign.center,
                              ),
                            ),
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
              ListTile(
                title: RichText(
                  text: const TextSpan(
                    children: [
                      WidgetSpan(
                        child: Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.ac_unit_sharp),
                        ),
                      ),
                      TextSpan(
                        text: 'List item content goes here',
                        style: TextStyle(fontSize: 16),
                      ),
                      TextSpan(
                        text: 'List item content goes here',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              //Mode
              Row(
                children: [
                  const Text(
                    "Mode: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  info["mode"] == Null
                      ? Text("Mode: ${info["mode"]}")
                      : const Text("Mode: Mixed"),
                ],
              ),

              //Company Details
              const SizedBox(height: 20),
              const Text(
                "Details: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              // TextField(labelText:"${info["companyDetails"]}"),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: "${info["companyDetails"]}",
                  labelStyle: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Location: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              // TextField(labelText:"${info["companyDetails"]}"),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: info["location"] != Null
                      ? "${info["location"]}"
                      : "Hybrid",
                  labelStyle: const TextStyle(
                    color: Colors.black,
                  ),
                ),
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
