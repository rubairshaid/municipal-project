import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'user_account.dart';
import 'mainPage.dart';
import 'loginPage.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  List<User_account> users = [];
  void fetchUsers() async {
    http.Response response = await http.post('http://portal.hepco.ps:7654/api/trainers', {trana:tan, pass:"pass"});
    if(response.statusCode == 200) {
      var jsonArray = jsonDecode(response.body)as List;
      users = jsonArray.map((e) => User_account.fromJson(e)).toList();
    }
    print (users);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LogInForm(users),));
  }
  @override
  void initState() {
    super.initState();
    fetchUsers();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitPouringHourglass(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}