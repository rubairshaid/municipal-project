import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'user_account.dart';

class LogInForm extends StatefulWidget {
  final List<User_account> users;
  LogInForm(this.users);
  @override
  _LogInFormState createState() => _LogInFormState(users);
}

class _LogInFormState extends State<LogInForm> {
  List<User_account> users;
  final _userName = TextEditingController();
  final _password = TextEditingController();
  _LogInFormState(this.users);

  bool _checkData(){
    // check if the username and the pass is correct 
    // if correct return true otherwise false 
    return false;
  }
  void _clearTextFields(){
    _userName.text="";
    _password.text="";
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
                        if(_checkData())
                        {
                          //navigate to the second page
                        }
                        else{
                          Toast.show("خطأ في اسم المتدرب أو كلمة المرور", context , backgroundColor: Colors.red , duration:Toast.LENGTH_LONG);
                          _clearTextFields();
                        }
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