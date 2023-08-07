import 'package:flutter/material.dart';

import 'Registration 2.dart';
import 'Registration.dart';
import 'Splash_screen.dart';
import 'drawer_page.dart';
import 'login.dart';

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
      home:Registration(),
    );
  }
}

