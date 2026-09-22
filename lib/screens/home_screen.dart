import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/custom_btn.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.back_hand_outlined),
        title: Center(
          child: Text(
            "Welcome Shahzaib",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: Text(
          "Counter: $counter ",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 15,
        children: [
          customBtn(counter, "+", Icons.add),
          customBtn(counter, "-", Icons.remove),
          customBtn(counter, "0", Icons.restore),
        ],
      ),
    );
  }
}
