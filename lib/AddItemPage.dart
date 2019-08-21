import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:todo/SelectDayPage.dart';
import 'package:todo/qrCodePage.dart';
import 'package:todo/todoListPage.dart';
import 'package:provider/provider.dart';
import 'AppState/applicationItemState.dart';
import 'model/TodoItem.dart';
import 'AppState/applicationThemeState.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _formKey = GlobalKey<FormState>();
  var result = 'select day';
  var qrCode = 'Tab to scan the QR code ';
  var newItem = TodoItem();

  @override
  Widget build(BuildContext context) {
    final appThemeState = Provider.of<AppThemeState>(context);
    final appItemstate = Provider.of<AppItemState>(context);

    return Container(
      child: Scaffold(
        backgroundColor: appThemeState.color,
        appBar: AppBar(
          title: Text('Add New'),
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
                        maxLines: 2,
                        onSaved: (value) {
                          newItem.name = value;
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
                        onSaved: (value) {
                          newItem.descripton = value;
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
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
                            newItem.days = popresult.days;
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
                        if (value != qrCode) {
                          qrCode = value;
                          newItem.qRcode = qrCode;
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
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        print(newItem.toString());
                        if (newItem.days != null) {
                          if (newItem.qRcode != null) {
                            await Navigator.pop(context);
                            newItem.qRcode = qrCode;
                            newItem.id = appItemstate.items.length;
                            appItemstate.add(newItem);
                          } else {
                            Alert(
                                    title: 'Alert',
                                    desc: 'Please scan a qr code  first',
                                    context: context)
                                .show();
                          }
                        } else {
                          Alert(
                                  title: 'Alert',
                                  desc: 'Please pick a day first',
                                  context: context)
                              .show();
                        }

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
