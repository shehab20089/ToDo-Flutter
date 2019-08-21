import 'package:flutter/material.dart';
import 'package:todo/SelectDayPage.dart';
import 'package:provider/provider.dart';
import 'package:todo/qrCodePage.dart';
import 'AppState/applicationItemState.dart';
import 'model/TodoItem.dart';
import 'AppState/applicationThemeState.dart';

class EditPage extends StatefulWidget {
  final TodoItem todo;

  const EditPage({Key key, @required this.todo}) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final _formKey = GlobalKey<FormState>();
  var result = 'asdasd';
  var qrCode = 'Tab to scan the QR code ';
  // var newItem = TodoItem();
  _EditPageState() {
    //
  }

  @override
  Widget build(BuildContext context) {
    final appThemeState = Provider.of<AppThemeState>(context);
    final appItemstate = Provider.of<AppItemState>(context);
    result = DateDay.dateToString(widget.todo.days);
    qrCode = widget.todo.qRcode;
    return Container(
      child: Scaffold(
        backgroundColor: appThemeState.color,
        appBar: AppBar(
          title: Text('Edit '),
          backgroundColor: appThemeState.color,
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Task Name',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                      TextFormField(
                        initialValue: widget.todo.name,
                        maxLines: 2,
                        onSaved: (value) {
                          widget.todo.name = value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          hintText: 'Enter the Task Name ',
                          fillColor: Colors.grey,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Description',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                      TextFormField(
                        maxLines: 3,
                        initialValue: widget.todo.descripton,
                        onSaved: (value) {
                          widget.todo.descripton = value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          hintText: 'Enter the Task Description ',
                          fillColor: Colors.grey,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter The task Description';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Task Day',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          final Day popresult = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SelectDayPage()),
                          );
                          setState(() {
                            result = popresult.dayName;
                            print('hello $result best day in the week');
                          });
                          widget.todo.days = popresult.days;
                        },
                        child: Container(
                          height: 70.4,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Text(
                              '$result',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () async {
                      final String value = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) => QRcode()));
                      setState(() {
                        if (value != null) {
                          qrCode = value;
                          widget.todo.qRcode = qrCode;
                        }
                      });
                    },
                    child: Container(
                      // color: Colors.yellow,
                      child: ListTile(
                        trailing: Image.asset(
                          'lib/images/icons8-ios-50.png',
                          height: 40,
                          width: 40,
                          color: Color.fromRGBO(60, 60, 60, 1),
                        ),
                        subtitle: Text(
                          qrCode,
                          style: TextStyle(
                              fontWeight: FontWeight.w100,
                              color: Color.fromRGBO(255, 255, 255, 0.8)),
                        ),
                        title: Text(
                          'Task Code',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        print(widget.todo.toString());

                        appItemstate.edit(widget.todo);
                        Navigator.pop(context);

                        //TODO:the logic of implementing the add item
                      }
                    },
                    color: appThemeState.color,
                    child: (Text(
                      'Add The Task +',
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          fontSize: 23),
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
