import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Directionality( // add this
        textDirection: TextDirection.rtl, // set this property
        child: Scaffold(
          appBar: AppBar(
            title: Text("الصفحة الشخصية ", textDirection: TextDirection.rtl,),
          ),
          drawer: Drawer(
            child : Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        leading: Icon(Icons.home, color: Colors.blue[500] , size: 30,),
                        title: Text("الرئيسية" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
                        onTap: (){},
                      ),
                      Divider(thickness: 2),
                      ListTile(
                        leading: Icon(Icons.person, color: Colors.blue[500] , size: 30,),
                        title: Text("المعلومات الشخصية" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
                        onTap: (){},
                      ),
                      Divider(thickness: 2),
                      ListTile(
                        leading: Icon(Icons.library_books, color: Colors.blue[500] , size: 30,),
                        title: Text("التقارير" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
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
                        title : Text("تسجيل الخروج" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
                        onTap: (){},
                      ),
                    )
                ),
              ],
            ),
          ),
          body:Column(
              children: [
                Expanded(
                    child: Container(
                      alignment : Alignment.topRight,
                      padding : EdgeInsets.all(5),
                      child:ListView(
                        children: [
                          ListItems(text1:"الاسم" , text2:"ربا ارشيد" , iconPara:"name"),
                          ListItems(text1:"الايميل" , text2:"----@gmail.com" , iconPara:"email"),
                          ListItems(text1:"رقم الجوال" , text2:"000555" , iconPara:"phone"),
                          ListItems(text1:"الجامعة" , text2:"بولتكنيك فلسطين " , iconPara:"univ"),
                          ListItems(text1:"التخصص" , text2:"هندسة حاسوب" , iconPara:"major"),
                          ListItems(text1:"السنة" , text2:"2021" , iconPara:"year"),
                          ListItems(text1:"رقم الهوية" , text2:"00000" , iconPara:"id"),
                          ListItems(text1:"نوع التدريب" , text2:"برمجة" , iconPara:"subject"),

                          ListItems(text1:"المشرف" , text2:"صلاح ادكيدك" , iconPara:"supervisor"),
                          ListItems(text1:"عدد ساعات التدريب" , text2:"150" , iconPara:"time"),

                        ],
                      ),


                    )
                )
              ]
          ),

        ),
      ),


    );
  }
}
class ListItems extends StatelessWidget{
  final String text1;
  final String text2;
  final String iconPara;
  final myIcons2 = <String, IconData> {
    'name': Icons.person_outline,
    'email': Icons.email,
    'phone': Icons.phone_android,
    'univ': Icons.account_balance,
    'major': Icons.book,
    'year': Icons.calendar_today,
    'id': Icons.perm_identity,
    'subject': Icons.subject,
    'supervisor': Icons.supervisor_account,
    'time': Icons.access_time,


  };

  ListItems({this.text1 , this.text2 , this.iconPara});
  @override
  Widget build (BuildContext context)
  {
    return Container(

      child: Container(
       //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0))),
        child:Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.purple.withOpacity(0.8),
                child: Icon(myIcons2[this.iconPara], color: Colors.white),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(15,0,30,0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(this.text1 , style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    Text(this.text2 ,style: TextStyle(color: Colors.grey,fontSize: 20),),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}