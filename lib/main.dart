import 'package:flutter/material.dart';
import 'package:thread/student.dart';
import 'package:thread/teacher.dart';
import 'package:thread/teachers_dashboard.dart';

import 'Announcement.dart';
import 'Employee 2.dart';
import 'Employee 1.dart';
import 'Employer.dart';
import 'Splash_screen.dart';
import 'drawer_page.dart';
import 'login.dart';
import 'new_dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home:Batch(),
    );
  }
}
