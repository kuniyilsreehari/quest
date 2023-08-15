import 'package:flutter/material.dart';

List<String> listitem=[
  'Environmental Studies','Social Studies','Fundamentals of Computer'
];

class Batch extends StatefulWidget {
  const Batch({Key? key}) : super(key: key);

  @override
  State<Batch> createState() => _BatchState();
}

class _BatchState extends State<Batch> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
      appBar: AppBar(
        bottom: const TabBar(tabs:[
          Tab(text: 'DETAILS'),
          Tab(text: 'ANNOUNCEMENT'),
          Tab(text: 'VIDEOS'),
          Tab(text: 'STUDY METERIALS'),

        ] ),
        title: Text("NEW BATCH"),
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
                icon: Icon(Icons.more_horiz),
                onPressed: () {
                  // Implement your search functionality here
                },
              ),

            ],
          ),
        ],
      ),
        body: TabBarView(children: [
          Container(
            child: ListView.builder(itemCount: listitem.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      tileColor: Colors.white,
                      title: Text(
                        listitem[index],
                        style: TextStyle(fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 25, horizontal: 16),
                    ),
                  );
                }
            ),
          )
        ],),
      ),
    );
  }
}


