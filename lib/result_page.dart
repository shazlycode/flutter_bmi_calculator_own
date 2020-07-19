import 'package:flutter/material.dart';
import 'input_page.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Center(
        child: Container(
          child: Text("Result Page"),
        ),
      ),
    );
  }
}
