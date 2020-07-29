import 'package:bmi_calculator/components/constants.dart';

import 'package:bmi_calculator/components/reusable_container.dart';
import 'package:flutter/material.dart';

import 'components/buttom_button.dart';

class ResultPage extends StatelessWidget {
  final String bmiResultText;
  final String bmiResultValue;
  final String comment;
  final String bmiRule;

  ResultPage(
      {@required this.bmiResultText,
      @required this.bmiResultValue,
      @required this.comment,
      @required this.bmiRule});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Your Result",
                style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: ReusableContainer(
                colors: kActiveContainerColor,
                containerChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      bmiResultText.toUpperCase(),
                      style: TextStyle(
                          color: Color(0xFF24D876),
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          bmiResultValue,
                          style: TextStyle(
                              fontSize: 100.0, fontWeight: FontWeight.bold),
                        ),
                        Text(bmiRule),
                      ],
                    ),
                    Text(
                      comment,
                      style: TextStyle(
                        fontSize: 22.0,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              )),
          BottomActionButton(
            btnTitle: "RE-CALCULATE",
            onTapBelowButton: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
