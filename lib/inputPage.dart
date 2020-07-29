import 'package:bmi_calculator/components/Icons_content.dart';
import 'package:bmi_calculator/resultPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/constants.dart';
import 'components/buttom_button.dart';
import 'components/reusable_container.dart';
import 'components/bmiCalculator.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 150;
  int weight = 20;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI Calculator',
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableContainer(
                  colors: selectedGender == Gender.male
                      ? kActiveContainerColor
                      : kInActiveContainerColor,
                  containerChild: ColumnWidget(
                      childIcon: FontAwesomeIcons.mars, childText: "MALE"),
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                ),
              ),
              Expanded(
                child: ReusableContainer(
                  colors: selectedGender == Gender.female
                      ? kActiveContainerColor
                      : kInActiveContainerColor,
                  containerChild: ColumnWidget(
                    childIcon: FontAwesomeIcons.venus,
                    childText: "FEMALE",
                  ),
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                ),
              ),
            ],
          )),
          Expanded(
            child: ReusableContainer(
              colors: kActiveContainerColor,
              containerChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "HEIGHT",
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextstyle,
                      ),
                      Text(
                        "cm",
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 10.0),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (double newHeight) {
                        setState(() {
                          height = newHeight.round();
                          print(height);
                        });
                      },
                      min: 120.0,
                      max: 500.0,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableContainer(
                  colors: kActiveContainerColor,
                  containerChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Weight",
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight > 0 ? weight.toString() : 0.toString(),
                        style: kNumberTextstyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CustomRoundButton(
                            icon: Icons.remove,
                            onPressed: () {
                              setState(() {
                                weight = weight - 1;
                                print(weight);
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CustomRoundButton(
                            icon: Icons.add,
                            onPressed: () {
                              setState(() {
                                weight = weight + 1;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableContainer(
                  colors: kActiveContainerColor,
                  containerChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "AGE",
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age > 0 ? age.toString() : 0.toString(),
                        style: kNumberTextstyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CustomRoundButton(
                            icon: Icons.remove,
                            onPressed: () {
                              setState(() {
                                age--;
                                print(age);
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CustomRoundButton(
                            icon: Icons.add,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
          BottomActionButton(
            btnTitle: "CALCULATE",
            onTapBelowButton: () {
              CalculateBmiResult calc = CalculateBmiResult(
                height: height,
                weight: weight,
              );

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            bmiResultValue: calc.calculateBMI(),
                            bmiResultText: calc.bmiTextResult(),
                            comment: calc.getComment(),
                            bmiRule: calc.getBmiRule(),
                          )));
            },
          )
        ],
      ),
    );
  }
}

//Creating Custome Button widgets
class CustomRoundButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  CustomRoundButton({@required this.icon, @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 16.0,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}

// class WeightOrHeightColumnChilds extends StatelessWidget {
//   final int weightOrheight;
//   final String labelText;

//   WeightOrHeightColumnChilds(
//       {@required this.labelText, @required this.weightOrheight});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Text(
//           labelText,
//           style: kLabelTextStyle,
//         ),
//         Text(
//           weightOrheight.toString(),
//           style: kNumberTextstyle,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             FloatingActionButton(
//               onPressed: () {},
//               child: Icon(Icons.add),
//               backgroundColor: Color(0xFF4C4F5E),
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             FloatingActionButton(
//                 backgroundColor: Color(0xFF4C4F5E),
//                 child: Icon(Icons.remove),
//                 onPressed: null)
//           ],
//         )
//       ],
//     );
//   }
// }
