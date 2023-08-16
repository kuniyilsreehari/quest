import 'package:flutter/material.dart';

List<String> listitem = [
  'Environmental Studies with\n human interaction', 'Conservation and Management\nof Water', 'Fundamentals of Computer and\n Artificial Intelligence', 'Traditional Health Care System', 'Cultural Studies'
];
List<String> listduedate = [
  'dec-24', 'nov-08', 'Aug-09', 'Aprl-01', 'may-04'
];
List<String> listsub1 = [
  'Genaral Study', 'Environmental Study', 'Basic Arithmatic', 'Sftware Development', 'Ethical Hacking'
];

class Study_materials extends StatefulWidget {
  const Study_materials({Key? key}) : super(key: key);

  @override
  State<Study_materials> createState() => _Study_materialsState();
}

class _Study_materialsState extends State<Study_materials> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(tabs: [
            Tab(text: 'DETAILS'),
            Tab(text: 'ANNOUNCEMENT'),
            Tab(text: 'VIDEOS'),
            Tab(text: 'STUDY MATERIALS'),
          ]),
          title: Text("PDF FILE"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          actions: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    // Implement your search functionality here
                  },
                ),
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {
                    // Implement your search functionality here
                  },
                ),
              ],
            ),
          ],
        ),
        body: TabBarView(
          children: [
            Container(
              child: ListView.builder(
                itemCount: listitem.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 90,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.grey, // Change the background color
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.picture_as_pdf,
                                      size: 32,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      listitem[index],
                                      style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 20,),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.lightGreen,
                                        padding: EdgeInsets.symmetric(horizontal: 16),
                                      ),
                                      onPressed: () {
                                        // Implement the action for the first button
                                      },
                                      child: Text('General Study'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              "Due Date\n" + listduedate[index],
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 25, horizontal: 16),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20,),
                            Row(
                              children: [],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Implement your action here
          },
          tooltip: "Add next",
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

