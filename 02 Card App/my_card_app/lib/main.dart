import 'package:flutter/material.dart';

void main() => runApp(CardApp());

class CardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Card App',
      home: Scaffold(
          backgroundColor: Color(0xFFbde0fe),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 100.0,
                backgroundColor: Color(0xFF003049),
                child: CircleAvatar(
                  radius: 95.0,
                  backgroundImage: AssetImage('images/icon.png',),
                ),
              ),
              Text(
                'Denzel Perez',
                style: TextStyle(
                  fontSize: 50.0,
                  color: Color(0xFF2f3e46),
                  fontFamily: 'Satisfy',
                ),
              ),
              Text(
                'Soy un programador',
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 200.0,
                child: Divider(color: Colors.black,
                thickness: 1.5,),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: ListTile(
                  title: Text(
                    '+1 849 220 2249',
                    style: TextStyle(
                      color: Color(0xFFf77f00),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: Icon(
                    Icons.phone,
                    color: Color(0xFFf77f00),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
                child: ListTile(
                  title: Text(
                    '1102259@est.intec.edu.do',
                    style: TextStyle(
                      color: Color(0xFFf77f00),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: Icon(
                    Icons.mail,
                    color: Color(0xFFf77f00),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}