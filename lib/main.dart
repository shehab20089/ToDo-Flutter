import 'package:flutter/material.dart';
import 'package:todo/AppState/applicationItemState.dart';
import 'AppState/applicationThemeState.dart';
import 'homePage.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider<AppThemeState>(
        builder: (_) => AppThemeState(),
      ),
      ChangeNotifierProvider<AppItemState>(
        builder: (_) => AppItemState(),
      ),
    ], child: MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}
