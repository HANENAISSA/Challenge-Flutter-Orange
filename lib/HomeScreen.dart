import 'package:challenge_flutter_orange/ResultPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:challenge_flutter_orange/Calculator.dart';

const kActiveColor = Color(0xFFED0954);
const kInactiveColor = Color(0xFF1D1E33);

Color femaleCont = kActiveColor;
Color maleCont = kInactiveColor;

enum Gender {
  male,
  female,
}

Gender selectedGender;

const kLabelText = TextStyle(
  fontSize: 18,
);

const kNumberText = TextStyle(
  fontSize: 45,
  fontWeight: FontWeight.bold,
);

const kBigButtomTextStyle = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.bold,
);

int height = 170;
int weight = 50;
int age = 22;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI FLUTTER CALCULATOR'),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableContainer(
                    otp: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    customChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.mars,
                          size: 75,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'MALE',
                          style: kLabelText,
                        ),
                      ],
                    ),
                    contColor: selectedGender == Gender.male
                        ? kActiveColor
                        : kInactiveColor,
                  ),
                ),
                Expanded(
                  child: ReusableContainer(
                    otp: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    customChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.venus,
                          size: 75,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'FEMALE',
                          style: kLabelText,
                        ),
                      ],
                    ),
                    contColor: selectedGender == Gender.female
                        ? kActiveColor
                        : kInactiveColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableContainer(
                    contColor: kInactiveColor,
                    customChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Height',
                          style: kLabelText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: kNumberText,
                            ),
                            Text(
                              'cm',
                              style: kLabelText,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 16),
                            thumbColor: kActiveColor,
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 32),
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Colors.blue,
                          ),
                          child: Slider(
                              value: height.toDouble(),
                              min: 120,
                              max: 220,
                              onChanged: (double changeHeight) {
                                setState(() {
                                  height = changeHeight.round();
                                });
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableContainer(
                    contColor: kInactiveColor,
                    customChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: kLabelText,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buttonPlusMinus(
                                buttonIcon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            SizedBox(width: 10),
                            buttonPlusMinus(
                                buttonIcon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableContainer(
                    contColor: kInactiveColor,
                    customChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: kLabelText,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buttonPlusMinus(
                                buttonIcon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            SizedBox(width: 10),
                            buttonPlusMinus(
                                buttonIcon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              Calculator calc = Calculator(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult2: calc.calculateBMI(),
                    resultText2: calc.getResult(),
                    resultInterp2: calc.getInterpretation(),
                  ),
                ),
              );
            },
          )
        ],
      )),
    );
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.buttonTitle});

  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kBigButtomTextStyle,
          ),
        ),
        height: 75,
        width: double.infinity,
        color: kActiveColor,
        margin: EdgeInsets.only(top: 18),
        padding: EdgeInsets.only(bottom: 13),
      ),
    );
  }
}

class buttonPlusMinus extends StatelessWidget {
  buttonPlusMinus({this.buttonIcon, this.onPress});
  final IconData buttonIcon;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(buttonIcon),
      onPressed: onPress,
      fillColor: kActiveColor,
      constraints: BoxConstraints.tightFor(
        width: 44,
        height: 44,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
    );
  }
}

class ReusableContainer extends StatelessWidget {
  const ReusableContainer({
    Key key,
    @required this.contColor,
    this.customChild,
    this.otp,
  }) : super(key: key);

  final Color contColor;
  final Widget customChild;
  final Function otp;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: otp,
      child: Container(
        child: customChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: contColor, borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
