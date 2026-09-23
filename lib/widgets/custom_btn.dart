import 'package:flutter/material.dart';

Widget customBtn(
  int counter,
  String operator,
  IconData icon,
  void Function() updateState,
) {
  return FloatingActionButton(
    child: Icon(icon),
    onPressed: () {
      print("Counter: $counter");
      print("Button pressed");
      updateState();
    },
  );
}
