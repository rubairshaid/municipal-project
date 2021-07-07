import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/sideDrawer.dart';

class JobDays extends StatelessWidget {
  List <dynamic> attendence;

  JobDays(this.attendence);
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text("الدوام"),
        ),
        drawer: SideDrawer(),
        body:Column(
          children: [
            Table(
              children: [
                TableRow(
                  children: [
                    Center(child: Text("اليوم")),
                    Center(child: Text("التاريخ")),
                    Center(child: Text("وقت البدء")),
                    Center(child: Text("وقت الانتهاء")),
                    Center(child: Text("المدة")),
                  ],
                ),
              for(var item in attendence )
                TableRow( 
                  children: [
                  Center(child: Text("الاحد")),
                  Center(child: Text(item['date'])),
                  Center(child: Text(item['check_in']==null? "-":item['check_in'])),
                  Center(child: Text(item['check_out']==null? "-":item['check_out'])),
                  Center(child: Text(item['diff']==null? "-":item['diff'])),
                  
                  ]
                )
              ]
            ),
          ],
        )
      ),
    );
  }
}
  