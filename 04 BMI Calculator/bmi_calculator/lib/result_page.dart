import 'package:bmi_calculator/card_widget.dart';
import 'package:bmi_calculator/design.dart';
import 'package:bmi_calculator/home_page.dart';
import 'package:flutter/material.dart';
import 'calculator.dart';

class ResultPage extends StatelessWidget {
  final Calculator calculator;
  ResultPage({super.key, required this.calculator});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(15.0),
            child: Text('Your result', style: kTitleTextStyle),
          )),
          Expanded(
            flex: 5,
            child: CardWidget(
              color: kInactiveCardColor,
              cardContent: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(calculator.getResults(),
                      style: TextStyle(
                          color: calculator.getTextColor(),
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold)),
                  Text(
                    calculator.bmi.toStringAsFixed(1),
                    style:
                        TextStyle(fontSize: 100.0, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      calculator.getAdvise(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ],
              ),
              tapAction: () {},
            ),
          ),
          GestureDetector(
            child: Container(
              width: double.infinity,
              height: 60.0,
              color: Color(0XFFEB1555),
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  style: kMainButtonStyle,
                ),
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HomePage();
              }));
            },
          ),
        ],
      ),
    );
  }
}
