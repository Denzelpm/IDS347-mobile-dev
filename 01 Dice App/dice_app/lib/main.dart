import 'package:flutter/material.dart';
import 'dart:math';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int leftDice = 1;
  int rightDice = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red.shade700,
        appBar: AppBar(
          backgroundColor: Colors.green.shade700,
          centerTitle: true,
          title: Text('Dice App'),
        ),
        body: Center(
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      leftDice = Random().nextInt(6) + 1;
                      rightDice = Random().nextInt(6) + 1;
                    });
                  },
                  child: Image.asset('images/dice$leftDice.png'),
                ),
              ),
              Expanded(
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        leftDice = Random().nextInt(6) + 1;
                        rightDice = Random().nextInt(6) + 1;
                      });
                    },
                    child: Image.asset('images/dice$rightDice.png')
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
