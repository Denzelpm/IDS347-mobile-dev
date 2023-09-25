import 'package:flutter/material.dart';

import 'value_screen.dart';

void main() => runApp(CoinTicker());

class CoinTicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.blue,
          scaffoldBackgroundColor: Colors.white
      ),
      title: 'Bitcoin App',
      home: ValueScreen(),
    );
  }
}
