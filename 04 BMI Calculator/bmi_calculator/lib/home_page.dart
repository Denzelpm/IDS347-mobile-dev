import 'package:flutter/material.dart';
import 'card_widget.dart';
import 'icon_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'design.dart';
import 'calculator.dart';
import 'result_page.dart';

const Color kInactiveCardColor = Color(0XFF111328);
const Color kActiveCardColor = Color(0XFF1D1E33);

enum Gender { Male, Female }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender? selectedGender;
  int height = 120;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: CardWidget(
                  color: selectedGender == Gender.Male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardContent: IconContent(
                    'MALE',
                    FontAwesomeIcons.mars,
                  ),
                  tapAction: () {
                    setState(() {
                      selectedGender = Gender.Male;
                    });
                  },
                ),
              ),
              Expanded(
                child: CardWidget(
                    color: selectedGender == Gender.Female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardContent: IconContent('FEMALE', FontAwesomeIcons.venus),
                    tapAction: () {
                      setState(() {
                        selectedGender = Gender.Female;
                      });
                    }),
              ),
            ],
          )),
          Expanded(
            child: CardWidget(
              color: kInactiveCardColor,
              cardContent: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kMainTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: TextStyle(
                            fontSize: 50.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' cm',
                        style: kMainTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                      min: 120.0,
                      max: 220.0,
                      value: height.toDouble(),
                      onChanged: (Newvalue) {
                        setState(() {
                          height = Newvalue.toInt();
                        });
                      }),
                ],
              ),
              tapAction: () {},
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CardWidget(
                    color: kInactiveCardColor,
                    cardContent: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kMainTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              weight.toString(),
                              style: TextStyle(
                                  fontSize: 50.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ' kg',
                              style: kMainTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                backgroundColor: Colors.white,
                                child: Icon(FontAwesomeIcons.minus),
                                onPressed: () {
                                  setState(() {
                                    if (weight > 30) weight--;
                                    // weight--;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            FloatingActionButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                backgroundColor: Colors.white,
                                child: Icon(FontAwesomeIcons.plus),
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                    tapAction: () {},
                  ),
                ),
                Expanded(
                  child: CardWidget(
                    color: kInactiveCardColor,
                    cardContent: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kMainTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: TextStyle(
                              fontSize: 50.0, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                backgroundColor: Colors.white,
                                child: Icon(FontAwesomeIcons.minus),
                                onPressed: () {
                                  setState(() {
                                    age > 18 ? age-- : age;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            FloatingActionButton(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Icon(FontAwesomeIcons.plus),
                                onPressed: () {
                                  setState(() {
                                    age < 100 ? age++ : age;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                    tapAction: () {},
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            child: Container(
              width: double.infinity,
              height: 60.0,
              color: Color(0XFFEB1555),
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: kMainButtonStyle,
                ),
              ),
            ),
            onTap: () {
              Calculator calc = Calculator(height, weight);
              String result = calc.calculateBMI();
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultPage(
                  calculator: calc,
                );
              }));
            },
          ),
        ],
      ),
    );
  }
}
