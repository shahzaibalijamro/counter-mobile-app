import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/custom_btn.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  bool checkBoxVal = false;

  void updateState(String operation) async {
    if (operation == "+") {
      setState(() {
        _counter++;
      });
    }
    if (operation == "-") {
      setState(() {
        _counter--;
      });
    }
    if (operation == "0") {
      setState(() {
        _counter = 0;
      });
    }
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("counter", _counter);
    print(prefs.getInt("counter"));
  }

  void setCounterFromPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt("counter") ?? 0;
      checkBoxVal = prefs.getBool("checkBoxVal") ?? false;
    });
    print(_counter);
  }

  void toggleCheckBox() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      checkBoxVal = !checkBoxVal;
      prefs.setBool("checkBoxVal", checkBoxVal);
    });
  }

  @override
  void initState() {
    super.initState();
    setCounterFromPrefs();
    // TODO: implement initState
  }

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
        child: Column(
          children: [
            Text(
              "Counter: $_counter ",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Checkbox(
              value: checkBoxVal,
              onChanged: (value) {
                toggleCheckBox();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 15,
        children: [
          customBtn(_counter, "+", Icons.add, (() => updateState("+"))),
          customBtn(_counter, "-", Icons.remove, (() => updateState("-"))),
          customBtn(_counter, "0", Icons.restore, (() => updateState("0"))),
        ],
      ),
    );
  }
}
