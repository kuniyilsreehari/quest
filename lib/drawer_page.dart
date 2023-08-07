import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isLoggedIn = true; // Set this to true if the user is logged in
  String userName = "Jasna"; // Replace with the user's name
  String userEmail = "jasna123@example.com"; // Replace with the user's email
  String userImageURL =
      "images/img_4.png"; // Replace with the user's image URL

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Employee page"),
        ),
        drawer: AppDrawer(
          isLoggedIn: isLoggedIn,
          userName: userName,
          userEmail: userEmail,
          userImageURL: userImageURL,
        ), // Pass user details to AppDrawer
      ),
    );
  }
}
class AppDrawer extends StatelessWidget {
  final bool isLoggedIn;
  final String userName;
  final String userEmail;
  final String userImageURL;

  const AppDrawer({
    required this.isLoggedIn,
    required this.userName,
    required this.userEmail,
    required this.userImageURL,
  });
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(userImageURL),
                  radius: 35,
                ),
                SizedBox(height: 10),
                Text(
                  userName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  userEmail,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('Home'),
            leading: Icon(Icons.home),
            onTap: () {
              // Add your home page navigation logic here
              Navigator.pop(context); // Closes the drawer
            },
          ),
          ListTile(
            title: Text('Profile'),
            leading: Icon(Icons.person),
            onTap: () {
              // Add your profile page navigation logic here
              Navigator.pop(context); // Closes the drawer
            },
          ),
          if (isLoggedIn)
            ListTile(
              title: Text('Sign Out'),
              leading: Icon(Icons.logout),
              onTap: () {
                // Add your sign-out logic here
                Navigator.pop(context); // Closes the drawer
              },
            ),
          // Add more ListTiles for other navigation options
        ],
      ),
    );
  }
}
