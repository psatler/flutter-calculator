import 'package:flutter/material.dart';

import 'button.dart';
import 'button_row.dart';

class Keyboard extends StatelessWidget {

  final void Function(String) keyboardCb;

  Keyboard(this.keyboardCb);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Column(
        children: <Widget>[
          ButtonRow(
            [
              Button.big(text: 'AC', color: Button.DARK, callback: keyboardCb, ),
              Button(text: '%', color: Button.DARK, callback: keyboardCb,),
              Button.operation(text: '/', callback: keyboardCb),
            ],
          ),
          SizedBox(height: 1),
          ButtonRow(
            [
              Button(text: '7', callback: keyboardCb),
              Button(text: '8', callback: keyboardCb),
              Button(text: '9', callback: keyboardCb),
              Button.operation(text: 'x', callback: keyboardCb),
            ],
          ),
          SizedBox(height: 1),
          ButtonRow(
            [
              Button(text: '4', callback: keyboardCb),
              Button(text: '5', callback: keyboardCb),
              Button(text: '6', callback: keyboardCb),
              Button.operation(text: '-', callback: keyboardCb),
            ],
          ),
          SizedBox(height: 1),
          ButtonRow(
            [
              Button(text: '1', callback: keyboardCb),
              Button(text: '2', callback: keyboardCb),
              Button(text: '3', callback: keyboardCb),
              Button.operation(text: '+', callback: keyboardCb),
            ],
          ),
          SizedBox(height: 1),
          ButtonRow(
            [
              Button.big(text: '0', callback: keyboardCb),
              Button(text: '.', callback: keyboardCb),
              Button.operation(text: '=', callback: keyboardCb),
            ],
          )
        ],
      ),
    );
  }
}