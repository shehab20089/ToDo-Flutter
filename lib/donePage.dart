import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'AddItemPage.dart';
import 'AppState/applicationItemState.dart';
import 'AppState/applicationThemeState.dart';
import 'EditItemPage.dart';

class DonePage extends StatelessWidget {
  final rowCount;
  final itemsize;
  const DonePage({Key key, this.rowCount, this.itemsize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appThemeState = Provider.of<AppThemeState>(context);
    final appItemstate = Provider.of<AppItemState>(context);

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Done'),
          backgroundColor: appThemeState.color,
        ),
        backgroundColor: appThemeState.color,
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
                children:
                    List.generate(appItemstate.itemsDone.length + 1, (index) {
                  print(appItemstate.itemsDone);
                  if (index != appItemstate.itemsDone.length + 1 - 1) {
                    print(appItemstate.itemsDone);
                    return Dismissible(
                      onDismissed: (d) {
                        if (d == DismissDirection.startToEnd)
                          appItemstate
                              .removeDone(appItemstate.itemsDone[index]);
                        else
                          appItemstate
                              .returnUnDone(appItemstate.itemsDone[index]);
                      },
                      background: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.red,
                        ),
                        child: Icon(
                          Icons.delete,
                          size: 80,
                        ),
                      ),
                      secondaryBackground: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.green,
                        ),
                        child: Icon(Icons.done),
                      ),
                      key: new Key(appItemstate.itemsDone[index].id.toString()),
                      child: GestureDetector(
                        onLongPress: () {},
                        child: ListItem(
                          textdecore: TextDecoration.lineThrough,
                          color: Colors.grey,
                          text: appItemstate.itemsDone[index].name,
                        ),
                      ),
                    );
                  } else
                    return FlatButton(
                      padding: EdgeInsets.all(0),
                      onPressed: null,
                      child: ListItem(
                        textdecore: TextDecoration.none,
                        text: "No Task is done ",
                        color: appThemeState.color,
                        textC: Colors.white,
                      ),
                    );
                }),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onVerticalDragEnd: (tab) {
                  Navigator.pop(context);
                },
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 20,
                        color: Colors.white,
                      ),
                      Text(
                        'Undone ',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final Color color;
  final Color textC;
  final TextDecoration textdecore;
  final String text;
  const ListItem(
      {Key key,
      @required this.color,
      this.text,
      this.textC,
      @required this.textdecore})
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
          style: TextStyle(color: textC, fontSize: 23, decoration: textdecore),
        ),
      ),
    );
  }
}
