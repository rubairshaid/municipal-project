import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar : AppBar(title : Text("tasks")),
        body :  ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (BuildContext context, int index){
            return Container(
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              margin: EdgeInsets.all(15),
              padding : EdgeInsets.all(8),
              height: 130,
              width: double.infinity,
              child: Column(
                crossAxisAlignment : CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment : MainAxisAlignment.end,
                    children: [
                      Text(tasks[index].day, style: TextStyle(fontWeight: FontWeight.bold,)),
                      Text(" :اليوم" , style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.grey[700])),
                    ],
                  ),
                  Text(" :المهمة", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.grey[700])),
                  AutoSizeText(tasks[index].taskDescription ,style :TextStyle(fontSize: 12,),maxLines: 1,),
                ],
              ),
            );
          }
        ),
      )
    );
  }
}

List <Task> tasks = [
  Task("1-1-1999" , "لمهمfdjhsjkfhdksjhfksjhfdsdsfd  dsf sdf df sd dsة في اليوم الاو ذلك حاليا"),
  Task("2-2-2000" , "this is the sec pthing go ok;;;;!!!!!!111"),
  Task("1-1-1999" , "لمهمة في اليوم الاو ذلك حاليا"),
  Task("2-2-2000" , "this is the sec pthing go ok;;;fdg111"),
  Task("1-1-1999" , "لمهمة في اليوم الاو ذلك حاليا"),
  Task("2-2-2000" , "this is the sec pthing gooooooooooooooooooooooooo ok;;;;!!!!!!111"),
  Task("1-1-1999" , "القيام بالمهمة رقم واحد واثنان وثلاثة ويوبةسينبتمينلتيمن الاتل لا لال لالاتلات ل ا"),
  Task("2-2-2000" , "this is the sec pthing go ok;;;;!!!!!!111"),
];
class Task {
  String day; 
  String taskDescription;
  Task(this.day , this.taskDescription);
}