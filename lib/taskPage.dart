import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_application_1/sideDrawer.dart';
import 'package:http/http.dart' as http;
class TasksPage extends StatelessWidget {
  List <dynamic> tasks;

  TasksPage(this.tasks);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Directionality( // add this
            textDirection: TextDirection.rtl, // set this property
            child: Scaffold(
              appBar : AppBar(title : Text("المهمات المنجزة")),
              drawer: SideDrawer(),
              body :  ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      margin: EdgeInsets.fromLTRB(15 , 10 , 15 , 5),
                      padding : EdgeInsets.all(12),

                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment : CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(tasks[index]['task']==null? "لم يتم وضع مهمة":tasks[index]['task'] ,style :TextStyle(fontSize:15,),maxLines: 3,),
                          Row(
                            mainAxisAlignment : MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('\n'),
                              Text(tasks[index]['created_at'].substring(0,10), style: TextStyle(fontWeight: FontWeight.bold,)),

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

