import 'package:flutter/material.dart';
import 'package:flutter_application_1/loginPage.dart';
import 'package:flutter_application_1/taskPage.dart';
import 'mainPage.dart';
import 'personalPage.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 45),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue.withOpacity(0.8),
              child: Icon(Icons.person, color: Colors.white, size: 70),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Divider(thickness: 2),
                ListTile(
                  trailing: Icon(
                    Icons.home,
                    color: Colors.blue[500],
                    size: 30,
                  ),
                  leading: Text(
                    "الرئيسية",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainPage(),
                        ));
                  },
                ),
                Divider(thickness: 2),
                ListTile(
                  trailing: Icon(
                    Icons.person,
                    color: Colors.blue[500],
                    size: 30,
                  ),
                  leading: Text(
                    "المعلومات الشخصية",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PersonalPage(),
                        ));
                  },
                ),
                Divider(thickness: 2),
                ListTile(
                  trailing: Icon(
                    Icons.library_books,
                    color: Colors.blue[500],
                    size: 30,
                  ),
                  leading: Text(
                    "التقارير",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TasksPage(),
                        ));
                  },
                ),
                Divider(thickness: 2),
              ],
            ),
          ),
          Container(
              child: Align(
            child: ListTile(
              trailing: Icon(Icons.logout, size: 30),
              leading: Text(
                "تسجيل الخروج",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LogInForm(),
                    ));
              },
            ),
          )),
        ],
      ),
    );
  }
}
