import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/personalPage.dart';
import 'package:flutter_application_1/userObj.dart';
import 'package:toast/toast.dart';
import 'user_account.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'user_account.dart';

class LogInForm extends StatefulWidget {

  @override
  _LogInFormState createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  final _userName = TextEditingController();
  final _password = TextEditingController();

  var user;
  void fetchUsers() async {
    http.Response response = await http.post(
      Uri.parse('http://portal.hepco.ps:7654/api/trainers'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'trainer_no': '1',
        'password' : '123'
      }),
    );
    if(response.statusCode == 200) {
      var jsonObj= jsonDecode(response.body);
      user = jsonObj.map((e) => User_account.fromJson(e));
      usedUser = user ;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>PersonalPage(),));
    }
    print (user);
    Toast.show("خطأ في اسم المتدرب أو كلمة المرور", context , backgroundColor: Colors.red , duration:Toast.LENGTH_LONG);
    _clearTextFields();
  }

  Future<User_account> createAlbum() async {
    final response = await http.post(
      Uri.parse('http://portal.hepco.ps:7654/api/trainers'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'trainer_no': '1',
        'password' : '123'
      }),
    );

    if (response.statusCode == 200) {
      usedUser  = User_account.fromJson(jsonDecode(response.body));
      print (usedUser.traning_hours);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>PersonalPage(),));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.

      throw Exception('Failed to create album.');
    }
  }

  void _clearTextFields(){
    _userName.text="";
    _password.text="";
  }
  Future<User_account> futureAlbum;
  void initState() {
    super.initState();
    futureAlbum = createAlbum();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Form(
            child : Container(
              padding: EdgeInsets.fromLTRB(20, 50, 20, 50),
              child: Column(
                children: [
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextField(
                        controller: _userName,
                        textAlign: TextAlign.right,
                        autofocus: true,
                        decoration: new InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "اسم المتدرب",
                        ),
                      ),
                  ),
                  SizedBox(height: 30),
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextField(
                        controller: _password,
                        textAlign: TextAlign.right,
                        autofocus: true,
                        decoration: new InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "كلمة المرور",
                        ),
                      ),
                  ),
                  SizedBox(height: 80),
                  SizedBox(
                    height: 60,
                    width : 200,
                    child: RaisedButton(
                      onPressed: (){
                        createAlbum();
                      },
                      color: Colors.blue,
                      child: Text ("تسجيل الدخول", style: TextStyle(fontSize: 20,color: Colors.white)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  )
                ]
              )
            )
          )
        ]
      ),
    );
  }
}