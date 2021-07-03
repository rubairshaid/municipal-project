import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:toast/toast.dart';
import 'sideDrawer.dart';
import 'userObj.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var startTime="";
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
                                        Text(startTime,
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

class TaskDialog extends StatefulWidget {
  @override
  _TaskDialogState createState() => _TaskDialogState();
}

class _TaskDialogState extends State<TaskDialog> {
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
          _alertCode(context);
        });
  }
  void _alertCode (BuildContext context)
    {
      showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("إضافة المهمة اليومية" , textAlign: TextAlign.center,),
            titlePadding: EdgeInsets.only(top:40),
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
            actions: [
              FlatButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                padding: EdgeInsets.all(10),
                color: Colors.blue,
                child: Text("إلغاء"),
                                
              ),
                FlatButton(
                onPressed: () async {
                  if(_dailyTask.text!="")
                  {
                    final response = await http.post(
                      Uri.parse('http://portal.hepco.ps:7654/api/trainer-tasks'),
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                      },
                      body: jsonEncode(<String,String>{
                        'trainer_id': usedUser.id.toString(),
                        'task' : _dailyTask.text,
                      }),
                    );
                    if (response.statusCode == 200 ) { 
                      _dailyTask.text="";
                      Toast.show(" تم حفظ المهمة لليوم بنجاح :)", context , backgroundColor: Colors.green[300] , duration:Toast.LENGTH_LONG , gravity: 30);
                    }
                    else{
                      Toast.show("حدث خطأ ما اثناء تسجيل المهمة", context , backgroundColor: Colors.red , duration:Toast.LENGTH_LONG , gravity: 30);
                    }
                    Navigator.pop(context);
                  }
                  else 
                    Toast.show("قم بتعبئة الحقل", context , backgroundColor: Colors.red , duration:Toast.LENGTH_LONG , gravity: 30);
              },
              padding: EdgeInsets.all(10),
              color: Colors.blue,
              child: Text("حفظ"),
                ),
            ],
          );
        }
        );
      
    }
}

class CheckInOUT extends StatefulWidget {
  @override
  _CheckInOUTState createState() => _CheckInOUTState();
}

class _CheckInOUTState extends State<CheckInOUT> {
  bool checkedIn = false;

  Widget getCheckColumn() {
    if (checkedIn)
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.logout, size: 50, color: Colors.red[800]),
          Text("تسجيل خروج ",
              style: TextStyle(fontSize: 20, color: Colors.red[800], fontWeight: FontWeight.bold)),
        ],
      );
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.login, size: 50, color: Colors.blue[800]),
        Text("تسجيل دخول", style: TextStyle(fontSize: 20, color: Colors.blue[800] , fontWeight: FontWeight.bold),),
      ],
    );
  }
  Future<void> checkInOutFunctionality() async {
      final response = await http.post(
        Uri.parse('http://portal.hepco.ps:7654/api/trainee-attendances'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, int>{
          'trainer_id': usedUser.id,
        }),
      );
      if (response.statusCode == 200 ) { 
        var data = jsonDecode(response.body);

        setState(() {
          startTime = data['data']['check_in'];
          checkedIn = !checkedIn;
        });
      } 
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
                checkInOutFunctionality();
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
