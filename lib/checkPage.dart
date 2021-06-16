import 'package:flutter/material.dart';

void main ()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build (BuildContext context)
  {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("لم يتم التحديد", textDirection: TextDirection.rtl,),
            ),
            drawer: Drawer(
              child : Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        ListTile(
                          leading: Icon(Icons.home, color: Colors.blue[500] , size: 30,),
                          trailing: Text("الرئيسية" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
                          onTap: (){},
                        ),
                        Divider(thickness: 2),
                        ListTile(
                          leading: Icon(Icons.person, color: Colors.blue[500] , size: 30,),
                          trailing: Text("المعلومات الشخصية" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
                          onTap: (){},
                        ),
                        Divider(thickness: 2),
                        ListTile(
                          leading: Icon(Icons.library_books, color: Colors.blue[500] , size: 30,),
                          trailing: Text("التقارير" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
                          onTap: (){},
                        ),
                        Divider(thickness: 2),
                      ],
                    ),
                  ),
                  Container(
                      child: Align(
                        child: ListTile(
                          leading :Icon(Icons.favorite ,size : 30),
                          trailing : Text("تسجيل الخروج" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
                          onTap: (){},
                        ),
                      )
                  ),
                ],
              ),
            ),
            body:Container(
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.fromLTRB(10,0,10,5),
                        decoration: BoxDecoration(
                          boxShadow:[
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 20,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),

                    ),

                    Expanded(
                      child: ListView(
                        children: [
                          ListItems(text1:"Address" , text2:"Ensure your harvesting address" , iconPara:"location_on"),
                          ListItems(text1:"Privacy" , text2:"System permision change" , iconPara:"lock"),
                          ListItems(text1:"General" , text2:"Basic functional settings" , iconPara:"settings"),
                          ListItems(text1:"Notefications" , text2:"take over the news on time" , iconPara:"notifications"),
                        ],
                      ),
                    ),
                  ],
                )
            )
        )
    );
  }
}


class ListItems extends StatelessWidget{
  final String text1;
  final String text2;
  final String iconPara;
  final myIcons2 = <String, IconData> {
    'location_on': Icons.location_on,
    'lock': Icons.lock,
    'settings': Icons.settings,
    'notifications': Icons.notifications,
  };

  ListItems({this.text1 , this.text2 , this.iconPara});
  @override
  Widget build (BuildContext context)
  {
    return Container(
      margin: EdgeInsetsDirectional.fromSTEB(0 , 10 , 0 ,5),
      padding: EdgeInsets.fromLTRB(10 ,0, 10,0),
      decoration: BoxDecoration(
        boxShadow:[
          BoxShadow(
            color: Colors.blue.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 80,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        child:Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.purple.withOpacity(0.8),
                child: Icon(myIcons2[this.iconPara], color: Colors.white),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15,0,0,0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(this.text1 , style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(this.text2 ,style: TextStyle(color: Colors.grey),),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child:  Icon(Icons.arrow_forward_ios, color:Colors.grey.withOpacity(0.8),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}