import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Khazov Daniil Vadimovich'),
          centerTitle: true,
          backgroundColor: Colors.green,
          leading: Icon(Icons.account_balance),
        ),
        body: Wrap(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              width: 100,
              height: 120,
              color: Colors.red,
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: 110,
              height: 90,
              color: Colors.green,
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: 70,
              height: 140,
              color: Colors.blue,
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: 150,
              height: 150,
              color: Colors.yellow,
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: 100,
              height: 100,
              color: Colors.purple,
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: 50,
              height: 50,
              color: Colors.deepOrange,
            )
          ],
        ),
      ),
    );
  }
}
