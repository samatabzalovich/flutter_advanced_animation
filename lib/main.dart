import 'package:flutter/material.dart';
import 'package:flutter_application_advanced/example2/example2.dart';
import 'package:flutter_application_advanced/example3/example3.dart';
import 'package:flutter_application_advanced/example4/example4.dart';
import 'package:flutter_application_advanced/example5/example5.dart';
import 'package:flutter_application_advanced/example6/example6.dart';
import 'package:flutter_application_advanced/example7/example7.dart';
import 'package:flutter_application_advanced/example8/example8.dart';

void main() {
  runApp(const App());
}
class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home:  Example8(),
    );
  }
}