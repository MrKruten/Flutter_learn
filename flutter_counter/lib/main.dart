import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.lightBlueAccent,
            appBar: AppBar(
              title: Text('Counter Khazov Daniil Vadimovich'),
              centerTitle: true,
              backgroundColor: Colors.blue,
              leading: Icon(Icons.account_balance),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 1.0, vertical: 100),
                    child: Text(
                      'Mobile application development',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Text(
                    'Tap "-" to decrement',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  CounterWidget(),
                  Text(
                    'Tap "+" to increment',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            )));
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _count = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 140.0, vertical: 7),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.indigo[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                setState(() {
                  _count--;
                });
              },
              icon: Icon(Icons.remove)),
          Text(
            '$_count',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  _count++;
                });
              },
              icon: Icon(Icons.add)),
        ],
      ),
    );
  }
}
