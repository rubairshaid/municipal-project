import 'package:flutter/material.dart';

void main ()
{
    runApp(MyApp());
}

class MyApp extends StatelessWidget{
    @override 
    Widget build (BuildContext context)
    {
        return MaterialApp(
            home: Scaffold(
                appBar: AppBar(
                  title: Text("الرئيسية", textDirection: TextDirection.rtl,),
                  centerTitle: true,
                ),
                endDrawer: Drawer(
                  child : Column(
                    children: [
                      Expanded(
                        child: ListView(
                          children: [
                            ListTile(
                              leading: Icon(Icons.home, color: Colors.blue[500] , size: 30,),
                              trailing: Text("الرئيسية" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
                              onTap: (){},
                            ),
                            Divider(thickness: 2),
                            ListTile(
                              leading: Icon(Icons.person, color: Colors.blue[500] , size: 30,),
                              trailing: Text("المعلومات الشخصية" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
                              onTap: (){},
                            ),
                            Divider(thickness: 2),
                            ListTile(
                              leading: Icon(Icons.library_books_outlined, color: Colors.blue[500] , size: 30,),
                              trailing: Text("التقارير" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
                              onTap: (){},
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
                ),
                body:Container(
                  margin: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                            Container(
                                padding: EdgeInsets.fromLTRB(10,0,10,5),
                                decoration: BoxDecoration(
                                    boxShadow:[
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 20,
                                            offset: Offset(0, 3),
                                        ),
                                    ],
                                  ),
                                child: Card(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                                    color: Colors.blue[400],
                                    child: Column(
                                        children: [
                                            Row(
                                                children: [
                                                    Container(
                                                        padding: EdgeInsets.all(15),
                                                        child: CircleAvatar(
                                                                radius: 35,
                                                                backgroundImage: AssetImage('assets/profile.jpg'),
                                                            ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        padding: EdgeInsets.fromLTRB(10,0,20,0),
                                                        child:Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children:[
                                                                Row(
                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                    children: [
                                                                        Text("ربى ارشيد" ,style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20, color: Colors.white )),
                                                                    ],
                                                                ),
                                                            ],
                                                        ),
                                                     )
                                                    )
                                                ],
                                            ),
                                            Container(
                                              color:Colors.blue[400],
                                              padding : EdgeInsets.fromLTRB(0, 0, 20, 20),
                                            ),
                                        ],
                                    )
                                )
                            ),
                          SizedBox(height: 30),
                          Column(
                            children: [
                              Text("عدد الساعات" ,style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),),
                              Container(
                                padding: EdgeInsets.fromLTRB(10,10,10,10),
                                margin: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30.0),
                                            bottomRight: Radius.circular(30.0),
                                          ),
                                        ),
                                        padding: EdgeInsets.only(top: 15 , bottom: 15),
                                        child: Column(
                                          children: [
                                            Text("المقطوعة", style: TextStyle(fontWeight: FontWeight.bold , fontSize: 15),),
                                            Text("40"),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30.0),
                                            bottomRight: Radius.circular(30.0),
                                          ),
                                        ),
                                        padding: EdgeInsets.only(top: 15 , bottom: 15),
                                        child: Column(
                                          children: [
                                            Text("المتبقية" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 15),),
                                            Text("110"),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.blue[300],
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30.0),
                                            bottomRight: Radius.circular(30.0),
                                          ),
                                        ),
                                        padding: EdgeInsets.only(top: 15 , bottom: 15),
                                        child: Column(
                                          children: [
                                            Text("الكلية" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 15),),
                                            Text("150"),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ), 
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          CheckInOUT(),
                        ],
                    )
                ),
            floatingActionButton: FloatingActionButton.extended(
              backgroundColor: Colors.grey[200],
              foregroundColor: Colors.black,
              icon: Icon(Icons.add),
              label: Text("إضافة المهمة اليومية"),
              onPressed: (){},
            ),
            bottomNavigationBar: BottomAppBar(
              child: Container (
                height: 70,
                 decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 3, color: Colors.blueGrey),
                    ),
                    color: Colors.blue,
                  ),
                )
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          )
        );
    }
}

class CheckInOUT extends StatefulWidget {
  @override
  _CheckInOUTState createState() => _CheckInOUTState();
}

class _CheckInOUTState extends State<CheckInOUT> {
  bool checkedIn= true ; 
  
  Widget getIcon(){
    if (checkedIn)
      return  Icon(Icons.logout , size :40 , color: Colors.red);
    return Icon(Icons.login , size :40 , color: Colors.green);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
       child: TextButton.icon(
         icon: getIcon(), 
         label: Text(checkedIn? "تسجيل الخروج" : "تسجيل الدخول" , style: TextStyle(fontSize: 20 , fontWeight:FontWeight.bold,),),
         onPressed:(){
           setState(() {
             checkedIn= !checkedIn;
           });
         }
         )
    );
  }
}