import 'package:intl/intl.dart';

var usedUser ;
String startTime;
String finishTime;
String duration="- - : - -";
Map daysMap = {'Saturday': 'السبت' , 'Sunday': 'الأحد' , 'Monday':'الإثنين' ,'Tuesday' : 'الثلاثاء' , 
                'Wednesday': 'الأربعاء' , 'Thursday' :'الخميس' , 'Friday':'الجمعة'};
String dayName(String date)
{
  DateTime dt = DateTime.parse(date);
  var day = DateFormat('EEEE').format(dt);
  return daysMap[day];
}