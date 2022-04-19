import 'package:flutter/material.dart';
import 'home.dart';
import 'my_theme.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LTTW',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        secondaryHeaderColor: Colors.black,
        hintColor: Colors.grey[100],
        selectedRowColor: Colors.amberAccent,
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        accentColor: Colors.grey[300],
        // fontFamily: "Montserrat",
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        secondaryHeaderColor: Colors.white,
        hintColor: Colors.grey[900],
        selectedRowColor: Colors.amberAccent,
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        accentColor: Colors.grey[800],
        // fontFamily: "Montserrat",
      ),
      home: Home(),
    );
  }
}
