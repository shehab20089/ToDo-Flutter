import 'package:flutter/material.dart';
import 'package:todo/todoListPage.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:provider/provider.dart';
import 'model/TodoItem.dart';
import 'AppState/applicationThemeState.dart';

class SelectDayPage extends StatefulWidget {
  SelectDayPage({Key key}) : super(key: key);

  _SelectDayPage createState() => _SelectDayPage();
}

class _SelectDayPage extends State<SelectDayPage> {
  var selectedDay = new Day();

  List<GestureDetector> _buildListItemsFromDays() {
    int index = 0;
    return dayslist.map((day) {
      var boxDecoration = new BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.grey);
      if (selectedDay == day) {
        boxDecoration = new BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        );
      }
      var container = Container(
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.all(10),
          decoration: boxDecoration,
          child: Text(
            day.dayName,
            textDirection: TextDirection.ltr,
            style: TextStyle(fontSize: 30),
          ));
      final gestuareDetector = GestureDetector(
        child: container,
        onTap: () {
          setState(() {
            selectedDay = day;
          });
        },
      );
      return gestuareDetector;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final appstate = Provider.of<AppThemeState>(context);
    return Container(
      child: Scaffold(
        appBar: AppBar(
          leading: Text(''),
          titleSpacing: 56,
          title: Text('Hello everyone'),
          backgroundColor: appstate.color,
        ),
        backgroundColor: appstate.color,
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(8.0),
          child: ButtonTheme(
            height: 60,
            child: RaisedButton(
              onPressed: () {
                print(null == selectedDay.dayName);

                if (selectedDay.dayName == null) {
                  Alert(
                          context: context,
                          title: "Alert",
                          desc: "You must select a day .")
                      .show();
                } else {
                  Navigator.pop(context, selectedDay);
                }
              },
              color: Color.fromRGBO(57, 57, 57, 1),
              textColor: Colors.white,
              child: Text(
                'Done',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _buildListItemsFromDays(),
          ),
        ),
      ),
    );
  }
}

class Day {
  String dayName;
  Days days;
  Day({this.dayName, this.days});
}

List<Day> dayslist = [
  Day(dayName: 'Monday', days: Days.monday),
  Day(dayName: 'Tuesday', days: Days.tuesday),
  Day(dayName: 'Wensday', days: Days.wensday),
  Day(dayName: 'Thursday', days: Days.thursday),
  Day(dayName: 'Friday', days: Days.friday),
  Day(dayName: 'Saturday', days: Days.saturday),
  Day(dayName: 'Sunday', days: Days.sunday)
];
