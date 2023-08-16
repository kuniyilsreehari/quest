import 'package:flutter/material.dart';

List<String> listitem = [
  'Environmental Studies with\n human interaction', 'Conservation and Management\nof Water', 'Fundamentals of Computer and\n Artificial Intelligence', 'Traditional Health Care System', 'Cultural Studies'
];
List<String> listduedate = [
  'dec-24', 'nov-08', 'Aug-09', 'Aprl-01', 'may-04'
];List<String> listsub1 = [
  'Genaral Study', 'Environmental Study', 'Basic Arithmatic', 'Sftware Development', 'Ethical Hacking'
];


class Assignment_list extends StatefulWidget {
  const Assignment_list({Key? key}) : super(key: key);

  @override
  State<Assignment_list> createState() => _Assignment_listState();
}

class _Assignment_listState extends State<Assignment_list> {
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
          title: Text("ASSIGNMENT LIST"),
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
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ListTile(
                          // tileColor: Colors.blue.shade200,
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                listitem[index],
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Due Date\n"+listduedate[index],
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
                                children: [
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
                                  SizedBox(width: 16),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.yellow,
                                      padding: EdgeInsets.symmetric(horizontal: 16),
                                    ),
                                    onPressed: () {
                                      // Implement the action for the second button
                                    },
                                    child: Text('Geography'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
          },
          tooltip: "Add next",
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

