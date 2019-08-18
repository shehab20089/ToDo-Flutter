import 'package:flutter/material.dart';
import 'applicationThemeState.dart';
import 'homePage.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider<AppThemeState>(
      builder: (_) => AppThemeState(),
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}
