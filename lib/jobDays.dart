import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/sideDrawer.dart';
import 'userObj.dart';
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
        body:SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: DataTable(
              headingRowColor:
                MaterialStateColor.resolveWith((states) => Colors.grey[200]),
              columns: [
                 DataColumn(
                  label: Text(
                    "اليوم",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "التاريخ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "وقت البدء",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "وقت الانتهاء",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "المدة",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              rows: [
                for(var item in attendence )
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text(dayName(item['date']))),
                      DataCell(Text(item['date'])),
                      DataCell(Text(item['check_in']==null? "-":item['check_in'])),
                      DataCell(Text(item['check_out']==null? "-":item['check_out'])),
                      DataCell(Text(item['diff']==null? "-":item['diff'])),
                    ],
                  ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
  