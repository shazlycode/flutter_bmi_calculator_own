import 'package:flutter/material.dart';
import 'file:///E:/coding/Flutter%20Projects/flutter_bmi_calculator/lib/screens/input_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0D22),
        scaffoldBackgroundColor: Color(0xFF090C22),
      ),
      home: InputPage(),
    );
  }
}
