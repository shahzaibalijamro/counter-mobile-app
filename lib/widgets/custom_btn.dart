import 'package:flutter/material.dart';

Widget customBtn(int counter, String operator, IconData icon) {
  return FloatingActionButton(
    child: Icon(icon),
    onPressed: () {
      counter = operator == "+"
          ? counter += 1
          : operator == "-"
          ? counter + 1
          : counter = 0;
      print("Counter: $counter");
      print("Button pressed");
    },
  );
}
