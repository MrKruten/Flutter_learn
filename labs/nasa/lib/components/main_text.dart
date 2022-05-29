import 'package:flutter/material.dart';

class MainText extends StatelessWidget {
  final String text;
  const MainText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(
      color: Colors.black,
      fontSize: 18
    ),);
  }
}
