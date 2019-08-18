import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AppState/applicationThemeState.dart';

class TodoListPage extends StatefulWidget {
  // final Color color;
  // const SecondRoute({this.color}) : super();
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  @override
  Widget build(BuildContext context) {
    final appstate = Provider.of<AppThemeState>(context);
    // final appstate = Provider.of<AppThemeState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Tasks',
          style: TextStyle(fontSize: 20),
        ),
        // title: Text("Second Route"),
        backgroundColor: appstate.color,
      ),
      backgroundColor: appstate.color,
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        childAspectRatio: 1,
        crossAxisSpacing: 10,
        padding: EdgeInsets.all(20),
        // Generate 100 widgets that display their index in the List.
        children: List.generate(10, (index) {
          print(index);
          if (index != 9) {
            return ListItem(
              color: Colors.grey,
              index: index,
            );
          } else
            return ListItem(
              color: appstate.color,
              textC: Colors.white,
            );
        }),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final Color color;
  final Color textC;
  final int index;
  const ListItem({Key key, @required this.color, this.index, this.textC})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 10,
        color: this.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
          child: Text(
            'Item$index ',
            style: TextStyle(color: textC),
          ),
        ),
      ),
    );
  }
}
