import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/bmi_calculator_brain.dart';
import 'package:flutter_bmi_calculator/constants.dart';
import 'package:flutter_bmi_calculator/custom_card_content.dart';
import 'package:flutter_bmi_calculator/reusable_container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'file:///E:/coding/Flutter%20Projects/flutter_bmi_calculator/lib/screens/result_page.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = KInactiveCardColor;
  Color femaleCardColor = KInactiveCardColor;

//  void updateColor(Gender selectedGender) {
//    if (selectedGender == Gender.male) {
//
//      if (maleCardColor == inactiveCardColor) {
//        maleCardColor = activeCardColor;
//        femaleCardColor = inactiveCardColor;
//      } else {
//        maleCardColor = inactiveCardColor;
//      }
//    }
//    if (selectedGender == Gender.female) {
//      if (femaleCardColor == inactiveCardColor) {
//        femaleCardColor = activeCardColor;
//        maleCardColor = inactiveCardColor;
//      } else {
//        femaleCardColor = inactiveCardColor;
//      }
//    }
//  }
  bool maleIsSelected = false;
  bool femaleIsSelected = false;
  int height = 180;
  int weight = 60;
  int age = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          maleIsSelected = true;
                          femaleIsSelected = false;
                        });
                      },
                      child: ReusableContainer(
                        colour: maleIsSelected
                            ? KActiveCardColor
                            : KInactiveCardColor,
                        cardChild: CustomCardContent(
                          sexText: "MALE",
                          icon: Icon(
                            FontAwesomeIcons.mars,
                            size: 80,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          femaleIsSelected = true;
                          maleIsSelected = false;
                        });
                      },
                      child: ReusableContainer(
                        colour: femaleIsSelected
                            ? KActiveCardColor
                            : KInactiveCardColor,
                        cardChild: CustomCardContent(
                          icon: Icon(
                            FontAwesomeIcons.venus,
                            size: 80,
                          ),
                          sexText: "FEMALE",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableContainer(
                    colour: KInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "HEIGHT",
                          style: KLabelStyleText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: KBigLabelStyleText,
                            ),
                            Text(
                              "cm",
                              style: KLabelStyleText,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30),
                            thumbColor: Color(0xFFEB1555),
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Color(0xFF8D8E98),
                          ),
                          child: Slider(
                              value: height.toDouble(),
                              min: 120.0,
                              max: 220.0,
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.round();
                                });
                              }),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableContainer(
                    colour: KInactiveCardColor,
                    cardChild: Column(
                      children: <Widget>[
                        Text(
                          "Weight",
                          style: KLabelStyleText,
                        ),
                        Text(
                          weight.toString(),
                          style: KBigLabelStyleText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundedActionButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            SizedBox(
                              width: 10,
                            ),
                            RoundedActionButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableContainer(
                    colour: KInactiveCardColor,
                    cardChild: Column(
                      children: <Widget>[
                        Text(
                          "Age",
                          style: KLabelStyleText,
                        ),
                        Text(
                          age.toString(),
                          style: KBigLabelStyleText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundedActionButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            SizedBox(
                              width: 10,
                            ),
                            RoundedActionButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(top: 30),
              color: KPageBottomContainerColor,
              width: double.infinity,
              height: KPageBottomContainerHeight,
              child: GestureDetector(
                onTap: () {
                  CalculatorBrain bmiBrain =
                      CalculatorBrain(height: height, weight: weight);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(
                                bmiResult: bmiBrain.calculateBMI(),
                                resultText: bmiBrain.getResult(),
                                interpretation: bmiBrain.getInterpretation(),
                              )));
                },
                child: Text(
                  "Result",
                  textAlign: TextAlign.center,
                  style: kLargeButtonTextStyle,
                ),
              ),
            ),
          ],
        ));
  }
}

class RoundedActionButton extends StatelessWidget {
  RoundedActionButton({@required this.icon, @required this.onPressed});
  final Function onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: Color(0xFF4C4FE),
      shape: CircleBorder(),
    );
  }
}
