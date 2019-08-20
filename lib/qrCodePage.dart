import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/flutter_qr_reader.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'AppState/applicationItemState.dart';
import 'AppState/applicationThemeState.dart';

class QRcode extends StatelessWidget {
  const QRcode({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appThemeState = Provider.of<AppThemeState>(context);
    final appItemstate = Provider.of<AppItemState>(context);
    var scaneedFlag = false;

    return Scaffold(
      appBar: AppBar(
        title: Text('Add New'),
        backgroundColor: appThemeState.color,
      ),
      backgroundColor: appThemeState.color,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Scaning...',
          style: TextStyle(
              fontSize: 30, color: Color.fromRGBO(255, 255, 255, 0.7)),
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Text(
                'Scan QR code',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(
                children: <Widget>[
                  QrReaderView(
                    width: 500,
                    height: 400,
                    callback: (container) {
                      // container.setFlashlight();

                      container.startCamera((value, s) {
                        container.stopCamera();
                        if (!scaneedFlag) Navigator.pop(context, value);
                        scaneedFlag = true;
                      });
                    },
                  ),
                  Positioned(
                    top: 25,
                    left: 20,
                    child: Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                              width: 3,
                              style: BorderStyle.solid,
                              color: Color.fromRGBO(51, 255, 255, 1),
                            ),
                            left: BorderSide(
                              width: 3,
                              style: BorderStyle.solid,
                              color: Color.fromRGBO(51, 255, 255, 1),
                            )),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 25,
                    right: 20,
                    child: Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                              width: 3,
                              style: BorderStyle.solid,
                              color: Color.fromRGBO(51, 255, 255, 1),
                            ),
                            right: BorderSide(
                              width: 3,
                              style: BorderStyle.solid,
                              color: Color.fromRGBO(51, 255, 255, 1),
                            )),
                      ),
                    ),
                  ),
                  Positioned(
                    top: (70 + 100 + 50).toDouble(),
                    left: 20,
                    child: Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                              width: 3,
                              style: BorderStyle.solid,
                              color: Color.fromRGBO(51, 255, 255, 1),
                            ),
                            left: BorderSide(
                              width: 3,
                              style: BorderStyle.solid,
                              color: Color.fromRGBO(51, 255, 255, 1),
                            )),
                      ),
                    ),
                  ),
                  Positioned(
                    top: (70 + 100 + 50).toDouble(),
                    right: 20,
                    child: Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                              width: 3,
                              style: BorderStyle.solid,
                              color: Color.fromRGBO(51, 255, 255, 1),
                            ),
                            right: BorderSide(
                              width: 3,
                              style: BorderStyle.solid,
                              color: Color.fromRGBO(51, 255, 255, 1),
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Hold on your phone ',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}
