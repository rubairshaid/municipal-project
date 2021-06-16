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
            home: Directionality(
              textDirection: TextDirection.rtl,
                  child: Scaffold(
                  appBar: AppBar(
                    title: Text("الرئيسية", textDirection: TextDirection.rtl,),
                    centerTitle: true,
                  ),
                  drawer: Drawer(
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
                                      color: Colors.blue[500],
                                      child: Column(
                                          children: [
                                              Row(
                                                  children: [
                                                      Container(
                                                          padding: EdgeInsets.all(15),
                                                          child: CircleAvatar(
                                                            radius: 30,
                                                            backgroundColor: Colors.purple[200].withOpacity(0.8),
                                                            child: Icon(Icons.person, color: Colors.white , size : 35),
                                                        ),
                                                      ),
                                                      Container(
                                                          padding: EdgeInsets.fromLTRB(10,0,0,18),
                                                          child:Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children:[
                                                                  Row(
                                                                      children: [
                                                                          Text("ربى ارشيد" ,style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20, color: Colors.white )),
                                                                      ],
                                                                  ),
                                                                  Text("هندسة حاسوب" , style:TextStyle(color: Colors.white)),
                                                                  Text("جامعة بوليتكنك فلسطين" , style:TextStyle(color: Colors.white)),
                                                              ],
                                                          ),
                                                      )
                                                     
                                                  ],

                                              ),
                                              Text("عدد الساعات" , style: TextStyle (fontSize: 20 , color : Colors.white )),
                                              Container(
                                                  padding: EdgeInsets.fromLTRB(0,15,0,15),
                                                  child:Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                      children:[
                                                          PersonalInfo(text:"الكلية" , num: 150 ),
                                                          PersonalInfo(text:"المقطوعة" , num: 10 ),
                                                          PersonalInfo(text:"المتبقية" , num: 140 ),
                                                          
                                                      ],
                                                  )
                                              )
                                          ],

                                      )
                                  )
                             ),
                            SizedBox(height: 20),
                            Container(
                                padding: EdgeInsets.fromLTRB(10,10,10,10),
                                margin: EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                      //   decoration: BoxDecoration(
                                      //   boxShadow:[
                                      //       BoxShadow(
                                      //           color: Colors.grey.withOpacity(0.5),
                                      //           spreadRadius: 1,
                                      //           blurRadius: 30,
                                      //           offset: Offset(0, 3),
                                      //       ),
                                      //   ],
                                      // ),
                                        padding: EdgeInsets.only(top: 15 , bottom: 15),
                                        child:Container (
                                          padding : EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(20),),
                                            color: Colors.green[400],
                                          ),
                                          child : Column(
                                            children: [
                                              Row(
                                                children : [
                                                  Text("ساعة البدء   " , style : TextStyle(color: Colors.white , fontSize: 20)),
                                                  Text ("9:00" , style : TextStyle(color: Colors.white , fontSize: 17)),
                                                ]
                                              ),
                                              Row(
                                                children : [
                                                  Text("الوقت المقطوع لليوم  " , style : TextStyle(color: Colors.white , fontSize: 20)),
                                                  Text ("4" , style : TextStyle(color: Colors.white , fontSize: 17)),
                                                ]
                                              ),
                                            ],
                                          )
                                        )
                                      ),
                                    ),
                                  ],
                                ), 
                              ),
                            CheckInOUT(),
                          ],
                      )
                  ),
              floatingActionButton: FloatingActionButton.extended(
                backgroundColor: Colors.orange[900],
                foregroundColor: Colors.black,
                icon: Icon(Icons.add ,size : 27),
                label: Text("إضافة المهمة اليومية" , style : TextStyle (fontSize: 15 , color: Colors.white) ),
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
          ),
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
  String getImage (){
    if (checkedIn)
      return  'images/redPerson.jpg';
    return 'images/bluePerson.jpg';

  }
  @override
  Widget build(BuildContext context) {
    return Center(
             child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   FlatButton(
                     child: getIcon(),
                     onPressed: (){
                       setState(() {
                         checkedIn = !checkedIn;
                       });
                     },
                     ),
                   Container(
                     height: 100.0,
                     width: 100.0,
                     decoration: BoxDecoration(
                       image: DecorationImage(
                         image: AssetImage(getImage()),
                         fit: BoxFit.fill,
                       ),
                     ),
                   ),
                 ],
               ),
    );
  }
}

class PersonalInfo extends StatelessWidget{
    final String text ;
    final double num;
    PersonalInfo({this.text , this.num});

    @override
    Widget build (BuildContext context)
    {
        return Column(
                    children:[
                      Text(this.text , style: TextStyle(color: Colors.white)),
                      Text(this.num.toString(),style: TextStyle(color: Colors.white ,fontSize: 18, fontWeight:FontWeight.bold,)),
                        ],
                    );
    }
}