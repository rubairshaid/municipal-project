import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/userObj.dart';
import 'package:toast/toast.dart';
import 'mainPage.dart';
import 'user_account.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class LogInForm extends StatefulWidget {

  @override
  _LogInFormState createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  final _userName = TextEditingController();
  final _password = TextEditingController();

  var user;
  
  Future<User_account> fetchUser() async {
    final response = await http.post(
      Uri.parse('http://portal.hepco.ps:7654/api/trainers'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'trainer_no': _userName.text,
        'password' : _password.text,
      }),
    );

    if (response.statusCode == 200 ) { 
      usedUser  = User_account.fromJson(jsonDecode(response.body));
      if(usedUser.id != null){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>MainPage(),));
        }
      else {
        Toast.show("خطأ في اسم المتدرب أو كلمة المرور", context , backgroundColor: Colors.red , duration:Toast.LENGTH_LONG , gravity: 30);
        _clearTextFields();
      } 
    } 
    else {
      throw Exception('Failed to log-in');
    }
  }

  void _clearTextFields(){
    _userName.text="";
    _password.text="";
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
            textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
           child: Column(
            children: [
              Container(
                margin : EdgeInsets.only(top: 80),
                height: 200.0,
                width: 200.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/ManiLogo2.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Text("متدربين كهرباء الخليل", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Form(
                child : Container(
                  padding: EdgeInsets.fromLTRB(40, 50, 40, 50),
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
                                labelText: "رقم المتدرب",
                            ),
                          ),
                      ),
                      SizedBox(height: 30),
                      Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextField(
                            obscureText: true,
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
                            fetchUser();
                          },
                          color: Colors.blue,
                          child: Text ("تسجيل الدخول", style: TextStyle(fontSize: 20,color: Colors.white)),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                        ),
                      ),
                      SizedBox(height: 100),
                    ]
                  )
                )
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30, 0, 20, 0),
                child: AutoSizeText("إذا واجهتك مشاكل في تسجيل الدخول قم بمراجعة رئيس قسم الموارد البشرية في الطابق الرابع",
                style :TextStyle(fontSize:15,color: Colors.grey[800]),maxLines: 3,),
              ),
            ]
          ),
        ),
      ),
    );
  }
}