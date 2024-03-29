import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/donePage.dart';

import 'AddItemPage.dart';
import 'AppState/applicationItemState.dart';
import 'AppState/applicationThemeState.dart';
import 'EditItemPage.dart';
import 'model/TodoItem.dart';

class TodoListPage extends StatefulWidget {
  // final Color color;
  // const SecondRoute({this.color}) : super();
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  var currIcon = Icons.border_all;
  int rowCount = 2;
  double itemsize = 1.5;

  @override
  Widget build(BuildContext context) {
    final appstate = Provider.of<AppThemeState>(context);
    final appItemstate = Provider.of<AppItemState>(context);

    // final appstate = Provider.of<AppThemeState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Tasks',
          style: TextStyle(fontSize: 20),
        ),
        actions: <Widget>[
          Row(
            children: <Widget>[
              Text(
                  '${DateDay.dateToString(Days.values[DateTime.now().weekday - 1])}'),
              Icon(Icons.chevron_right),
              ButtonTheme(
                minWidth: 30,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      if (currIcon == Icons.border_all) {
                        currIcon = Icons.menu;
                        rowCount = 1;
                        itemsize = 3.5;
                      } else {
                        currIcon = Icons.border_all;
                        rowCount = 2;
                        itemsize = 1.5;
                      }
                    });
                  },
                  child: Icon(
                    currIcon,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ],
        // title: Text("Second Route"),
        backgroundColor: appstate.color,
      ),
      backgroundColor: appstate.color,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 8,
            child: GridView.count(
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this produces 2 rows.
              crossAxisCount: rowCount,
              mainAxisSpacing: 20,
              childAspectRatio: itemsize,
              crossAxisSpacing: 10,
              padding: EdgeInsets.all(20),
              // Generate 100 widgets that display their index in the List.
              children: List.generate(appItemstate.items.length + 1, (index) {
                print(index);
                if (index != appItemstate.items.length + 1 - 1) {
                  return Dismissible(
                    onDismissed: (d) {
                      if (d == DismissDirection.startToEnd)
                        appItemstate.remove(appItemstate.items[index]);
                      else
                        appItemstate.addDone(appItemstate.items[index]);
                    },
                    background: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.red,
                      ),
                      child: Icon(
                        Icons.delete,
                        size: 50,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    secondaryBackground: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.green,
                      ),
                      child: Icon(Icons.done),
                    ),
                    key: new Key(appItemstate.items[index].id.toString()),
                    child: GestureDetector(
                      onLongPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                EditPage(todo: appItemstate.items[index]),
                          ),
                        );
                      },
                      child: ListItem(
                        color: Colors.grey,
                        text: appItemstate.items[index].name,
                      ),
                    ),
                  );
                } else
                  return FlatButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddPage()),
                      );
                    },
                    child: ListItem(
                      text: "Add New +",
                      color: appstate.color,
                      textC: Colors.white,
                    ),
                  );
              }),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onVerticalDragDown: (tab) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DonePage(
                              rowCount: rowCount,
                              itemsize: itemsize,
                            )));
              },
              child: Container(
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.keyboard_arrow_up,
                      size: 20,
                      color: Colors.white,
                    ),
                    Text(
                      'Done ',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final Color color;
  final Color textC;
  final String text;
  const ListItem({Key key, @required this.color, this.text, this.textC})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: this.color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Center(
        child: Text(
          '$text ',
          style: TextStyle(color: textC, fontSize: 23),
        ),
      ),
    );
  }
}
