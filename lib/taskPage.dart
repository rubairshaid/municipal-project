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
        home:Directionality( // add this
            textDirection: TextDirection.rtl, // set this property
            child: Scaffold(
              appBar : AppBar(title : Text("المهمات المنجزة")),
              body :  ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      margin: EdgeInsets.all(8),
                      padding : EdgeInsets.all(8),

                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment : CrossAxisAlignment.start,
                        children: [

                          AutoSizeText(tasks[index].taskDescription ,style :TextStyle(fontSize: 20,),maxLines: 3,),
                          Row(
                            mainAxisAlignment : MainAxisAlignment.end,
                            children: [
                              Text(tasks[index].day, style: TextStyle(fontWeight: FontWeight.bold,)),

                            ],
                          ),
                        ],
                      ),
                    );
                  }
              ),
            )
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
  Task("2-2-2000" , "this is the sec pthing gooooooooooooooooooooooooo ok;;;;!!!!!!1fffffffffffffffffff"
      "fffffffffffffffffffffff"
      "ffffffffffffff"
      "f"
      "11"),
  Task("1-1-1999" , "القيام بالمهمة رقم واحد واثنان وثلاثة ويوبةسينبتمينلتيمن الاتل لا لال لالاتلات ل ا"),
  Task("2-2-2000" , "this is the sec pthing go ok;;;;!!!!!!111"),
];
class Task {
  String day;
  String taskDescription;
  Task(this.day , this.taskDescription);
}