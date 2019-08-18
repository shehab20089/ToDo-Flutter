import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'applicationThemeState.dart';

class TodoListPage extends StatelessWidget {
  // final Color color;
  // const SecondRoute({this.color}) : super();
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
      body: Center(
        child: RaisedButton(
          onPressed: () {
            appstate.setColor(Colors.purple);
            print(appstate.color);
            // Navigate back to first route when tapped.
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
