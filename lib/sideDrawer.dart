import 'package:flutter/material.dart';
import 'package:flutter_application_1/checkPage.dart';
import 'package:flutter_application_1/taskPage.dart';

import 'personalPage.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
            child : Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        leading: Icon(Icons.home, color: Colors.blue[500] , size: 30,),
                        trailing: Text("الرئيسية" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
                        onTap: (){
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainPage(),
                            ));
                        },
                      ),
                      Divider(thickness: 2),
                      ListTile(
                        leading: Icon(Icons.person, color: Colors.blue[500] , size: 30,),
                        trailing: Text("المعلومات الشخصية" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
                        onTap: (){
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PersonalPage(),
                            ));
                        },
                      ),
                      Divider(thickness: 2),
                      ListTile(
                        leading: Icon(Icons.library_books_outlined, color: Colors.blue[500] , size: 30,),
                        trailing: Text("التقارير" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
                        onTap: (){
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
                      leading :Icon(Icons.logout ,size : 30),
                      trailing : Text("تسجيل الخروج" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
                      onTap: (){},
                    ),
                  )
                ),
              ],
            ), 
          );              
  }
}