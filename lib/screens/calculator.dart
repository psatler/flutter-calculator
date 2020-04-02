import 'package:flutter/material.dart';

import '../components/display.dart';
import '../components/keyboard.dart';

class Calculator extends StatelessWidget {

  _onPressed(String text) {
    print(text);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        children: <Widget>[
          Display('213123'),
          Keyboard(_onPressed), // passing down the callback until it reaches the Button component
        ],
      ),
    );
  }
}