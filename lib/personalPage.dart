import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:Column( 
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Icon(Icons.person , size:100 , color: Colors.black),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                //bottomLeft: Radius.circular(3000) ,
                //bottomRight: Radius.circular(3000) ,
                ),
                border: Border.all(color: Colors.deepPurple.shade400, width: 40),
                /*border: Border(
                  left: BorderSide(color: Colors.lightBlue),
                  bottom: BorderSide(color: Colors.lightBlue),
                ),*/
              ),
            ),
            Expanded(
              child: Container(
                alignment : Alignment.topRight,
                padding : EdgeInsets.all(15),
                child:Column(
                  mainAxisAlignment : MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment : CrossAxisAlignment.end,
                  children:[// كتابة كل جزء بلون وسايز معين 
                    Text("الإسم: ربى ارشيد" , style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,)),
                    Text("ruba@gmail.com:الإيميل", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,)),
                    Text("000:رقم الجوال" , style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,)),
                    Text("الجامعة: بوليتكنك فلسطين" , style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,)),
                    Text("التخصص: هندسة حاسوب" , style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,)),
                    Text("السنة: 2021" , style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,)),
                    Text("333333333333:رقم الهوية" , style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,)),
                    Text("نوع التدريب: برمجة" , style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,)),
                    Text("المشرف: صلاح ادكيدك" , style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,)),
                    Text("عدد ساعات التدريب: 150" , style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,)),
                  ]
                ),
              ),
            ),
            
          ]
        ),
        
        
      ),
    );
  }
}
