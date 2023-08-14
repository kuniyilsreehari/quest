import 'package:flutter/material.dart';
class teacher_dashboard extends StatefulWidget {
  const teacher_dashboard({Key? key}) : super(key: key);

  @override
  State<teacher_dashboard> createState() => _teacher_dashboardState();
}

class _teacher_dashboardState extends State<teacher_dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.blue[900],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30,),
                      Text("Welcome to Your Homepage!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                      Text("2013,jan,2021"),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[600],
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(color:Colors.blue[600],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [Icon(Icons.search,
                    color: Colors.white,
                  ),
                    SizedBox(width: 5),
                    Text("Search",
                      style:TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Resent Works",
                  style:TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                Icon(Icons.more_horiz,
                  color: Colors.white,
                ),
              ],
            ),
            SizedBox(height: 25,),
            Row(
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
