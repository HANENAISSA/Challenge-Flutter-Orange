import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'package:challenge_flutter_orange/Calculator.dart';
import 'Calculator.dart';

const kTitleTextStyle = TextStyle(
  fontSize: 40,
  fontWeight: FontWeight.bold,
);

const kResultTextStyle = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 22,
  fontWeight: FontWeight.bold,
);

const kBMITextStyle = TextStyle(
  fontSize: 100,
  fontWeight: FontWeight.bold,
);

const kBodyTextStyle = TextStyle(
  fontSize: 22,
);

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.resultInterp2,
      @required this.bmiResult2,
      @required this.resultText2});

  final String bmiResult2;
  final String resultText2;
  final String resultInterp2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 20),
              child: Text(
                'YOUR RESULT',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableContainer(
              contColor: kInactiveColor,
              customChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText2.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult2,
                    style: kBMITextStyle,
                  ),
                  Text(
                    resultInterp2,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              buttonTitle: 'RE-CALCULATE'),
        ],
      ),
    );
  }
}
