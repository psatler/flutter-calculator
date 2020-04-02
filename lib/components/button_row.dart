
import 'package:flutter/material.dart';
import 'button.dart';

class ButtonRow extends StatelessWidget {
  final List<Button> buttons;

  ButtonRow(this.buttons);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons.fold(<Widget>[], (list, currentButton) {
          // if list (which is the accumulator) is empty, we add just the button
          // else, we add a SizedBox and a button
          list.isEmpty 
          ? list.add(currentButton) 
          : list.addAll([SizedBox(width: 1), currentButton]); // adding the vertical lines between the buttons

          return list;
        })
        )
      );
  }
}