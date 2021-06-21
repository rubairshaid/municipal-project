import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'sideDrawer.dart';
import 'userObj.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "الرئيسية",
            textDirection: TextDirection.rtl,
          ),
          centerTitle: true,
        ),
        drawer: SideDrawer(),
        body: Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 30),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 20,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          color: Colors.blue[500],
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(15),
                                    child: CircleAvatar(
                                      radius: 30,
                                      backgroundColor:
                                          Colors.purple[100].withOpacity(0.8),
                                      child: Icon(Icons.person,
                                          color: Colors.white, size: 47),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 15, 0, 18),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(usedUser.name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.white)),
                                        Text(usedUser.major,
                                            style:
                                                TextStyle(color: Colors.white)),
                                        Text(usedUser.univirsity,
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Text("عدد الساعات",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                              Container(
                                  padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      TrainingHours(
                                          text: "الكلية",
                                          hours: usedUser.traning_hours),
                                      TrainingHours(
                                          text: "المقطوعة", hours: '10'),
                                      TrainingHours(
                                          text: "المتبقية", hours: '140'),
                                    ],
                                  ))
                            ],
                          ))),
                  SizedBox(height: 30),
                  Divider(thickness: 2, indent: 20, endIndent: 20),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 50),
                    margin: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.only(top: 15, bottom: 15),
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Column(children: [
                                        Text("ساعة البدء   ",
                                            style: TextStyle(fontSize: 20)),
                                        Text("9:00",
                                            style: TextStyle(fontSize: 17)),
                                      ]),
                                      Column(children: [
                                        Text("\nالوقت المقطوع لليوم  ",
                                            style: TextStyle(fontSize: 20)),
                                        Text("4",
                                            style: TextStyle(fontSize: 17)),
                                      ]),
                                    ],
                                  ))),
                        ),
                        FlutterAnalogClock(
                          dateTime: DateTime.now(),
                          dialPlateColor: Colors.white,
                          borderColor: Colors.lightBlue[900],
                          tickColor: Colors.black,
                          centerPointColor: Colors.black,
                          showTicks: true,
                          showNumber: false,
                          borderWidth: 8.0,
                          hourNumberScale: 0.8,
                          hourNumbers: [
                            'I',
                            'II',
                            'III',
                            'IV',
                            'V',
                            'VI',
                            'VII',
                            'VIII',
                            'IX',
                            'X',
                            'XI',
                            'XII'
                          ],
                          isLive: true,
                          width: 150.0,
                          height: 150.0,
                          decoration: const BoxDecoration(),
                        ),
                      ],
                    ),
                  ),
                  CheckInOUT(),
                ],
              ),
            )),
        floatingActionButton: TaskDialog(),
        bottomNavigationBar: BottomAppBar(
            child: Container(
          height: 70,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 3, color: Colors.blueGrey),
            ),
            color: Colors.blue,
          ),
        )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

class TaskDialog extends StatelessWidget {
  final _dailyTask = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        backgroundColor: Colors.yellow[700],
        foregroundColor: Colors.black,
        icon: Icon(Icons.add, size: 27),
        label: Text("إضافة المهمة اليومية",
            style: TextStyle(fontSize: 15, color: Colors.black)),
        onPressed: () {
          Alert(
            context: context,
            title: "المهمة اليومية",
            content: TextField(
              controller: _dailyTask,
              textAlign: TextAlign.right,
              autofocus: true,
              maxLines: 10,
              decoration: new InputDecoration(
                border: OutlineInputBorder(),
                hintText: "أدخل ما تم انجازه خلال اليوم",
              ),
            ),
            buttons: [
              DialogButton(
                child: Text(
                  "حفظ",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                width: 120,
              )
            ],
          ).show();
        });
  }
}

class CheckInOUT extends StatefulWidget {
  @override
  _CheckInOUTState createState() => _CheckInOUTState();
}

class _CheckInOUTState extends State<CheckInOUT> {
  bool checkedIn = true;

  Widget getCheckColumn() {
    if (checkedIn)
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.logout, size: 50, color: Colors.red),
          Text("تسجيل خروج ",
              style: TextStyle(fontSize: 18, color: Colors.red)),
        ],
      );
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.login, size: 50, color: Colors.blue),
        Text("تسجيل دخول", style: TextStyle(fontSize: 18, color: Colors.blue)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.amber,
      margin: EdgeInsets.only(bottom: 15),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FlatButton(
              child: getCheckColumn(),
              onPressed: () {
                setState(() {
                  checkedIn = !checkedIn;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TrainingHours extends StatelessWidget {
  final String text;
  final String hours;
  TrainingHours({this.text, this.hours});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(this.text, style: TextStyle(color: Colors.white)),
        Text(this.hours,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
      ],
    );
  }
}
