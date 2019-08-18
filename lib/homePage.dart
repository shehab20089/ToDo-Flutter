import 'package:flutter/material.dart';

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
                      'Flutter App',
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
                          ColorItem(
                            r: 244,
                            g: 64,
                            b: 54,
                          ),
                          ColorItem(
                            r: 255,
                            b: 0,
                            g: 196,
                          ),
                          ColorItem(
                            r: 41,
                            b: 255,
                            g: 98,
                          ),
                          ColorItem(r: 49, g: 27, b: 146),
                          ColorItem(r: 0, g: 230, b: 118),
                          ColorItem(
                              r: 21, b: 21, g: 21, border: BorderStyle.solid)
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

class ColorItem extends StatelessWidget {
  final int r, g, b;
  final BorderStyle border;
  const ColorItem(
      {Key key,
      @required this.r,
      @required this.b,
      @required this.g,
      this.border = BorderStyle.none})
      : super(key: key);

  @override
  Widget build(BuildContext context2) {
    return Container(
      child: ButtonTheme(
          minWidth: 20,
          child: FlatButton(
            padding: EdgeInsets.all(0),
            child: Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(r, g, b, 1),
                    shape: BoxShape.circle,
                    border:
                        Border.all(style: this.border, color: Colors.white))),
            onPressed: () {
              Navigator.push(
                context2,
                MaterialPageRoute(
                    builder: (context) => SecondRoute(
                          color: new Color.fromRGBO(r, g, b, 1),
                        )),
              );
            },
          )),
    );
  }
}

class SecondRoute extends StatelessWidget {
  final Color color;
  const SecondRoute({this.color}) : super();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Tasks',
          style: TextStyle(fontSize: 20),
        ),
        // title: Text("Second Route"),
        backgroundColor: this.color,
      ),
      backgroundColor: this.color,
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
