import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/constants.dart';
import 'package:flutter_bmi_calculator/reusable_container.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;
  ResultPage({this.bmiResult, this.resultText, this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Text(
                "Your Result",
                style: KTitleStyleText,
              ),
            ),
            Expanded(
              flex: 6,
              child: ReusableContainer(
                colour: KActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resultText,
                      style: KResultStyleText,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      bmiResult,
                      style: kBMITextStyle,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      interpretation,
                      style: KBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(top: 30),
              color: KPageBottomContainerColor,
              width: double.infinity,
              height: KPageBottomContainerHeight,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(
                    context,
                  );
                },
                child: Text(
                  "Re-Calculate",
                  textAlign: TextAlign.center,
                  style: kLargeButtonTextStyle,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
