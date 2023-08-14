import 'package:flutter/material.dart';

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
          Tab(text: 'DETAILS'),

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
      )),
    );
  }
}
