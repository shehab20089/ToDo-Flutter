import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(21, 21, 21, 1),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 8,
              child: Container(
                margin: EdgeInsets.only(left: 23),
                // color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'My Tasks',
                      style: TextStyle(fontSize: 23, color: Colors.white),
                    ),
                    Text(
                      'My Tasks',
                      style: TextStyle(fontSize: 50, color: Colors.white),
                    ),
                    Text(
                      'My Tasks',
                      style: TextStyle(
                        fontSize: 23,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            child: Text(
                              "Choose Your Color",
                              style:
                                  TextStyle(fontSize: 23, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                            size: 34,
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 67,
                      color: Color.fromRGBO(0, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ButtonTheme(
                            minWidth: 20,
                            child: FlatButton(
                              padding: EdgeInsets.all(0),
                              child: Container(
                                  width: 34,
                                  height: 34,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(244, 67, 54, 1),
                                      shape: BoxShape.circle)),
                              onPressed: () {},
                            ),
                          ),
                          ButtonTheme(
                            minWidth: 20,
                            child: FlatButton(
                              padding: EdgeInsets.all(0),
                              child: Container(
                                  width: 34,
                                  height: 34,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(255, 196, 0, 1),
                                      shape: BoxShape.circle)),
                              onPressed: () {},
                            ),
                          ),
                          ButtonTheme(
                            minWidth: 20,
                            child: FlatButton(
                              padding: EdgeInsets.all(0),
                              child: Container(
                                  width: 34,
                                  height: 34,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(41, 98, 255, 1),
                                      shape: BoxShape.circle)),
                              onPressed: () {},
                            ),
                          ),
                          ButtonTheme(
                            minWidth: 20,
                            child: FlatButton(
                              padding: EdgeInsets.all(0),
                              child: Container(
                                  width: 34,
                                  height: 34,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(49, 27, 146, 1),
                                      shape: BoxShape.circle)),
                              onPressed: () {},
                            ),
                          ),
                          ButtonTheme(
                            minWidth: 20,
                            child: FlatButton(
                              padding: EdgeInsets.all(0),
                              child: Container(
                                  width: 34,
                                  height: 34,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(0, 230, 118, 1),
                                      shape: BoxShape.circle)),
                              onPressed: () {},
                            ),
                          ),
                          ButtonTheme(
                            minWidth: 20,
                            child: FlatButton(
                              padding: EdgeInsets.all(0),
                              child: Container(
                                  width: 34,
                                  height: 34,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(21, 21, 21, 1),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 0.5, color: Colors.white))),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
