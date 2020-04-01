import 'package:flutter/material.dart';

import 'button.dart';
import 'button_row.dart';

class Keyboard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Column(
        children: <Widget>[
          ButtonRow(
            [
              Button(text: '7',),
              Button(text: '8',),
              Button(text: '9',),
            ],
          ),
          ButtonRow(
            [
              Button(text: '4',),
              Button(text: '5',),
              Button(text: '6',),
            ],
          ),
        ],
      ),
    );
  }
}