
import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String input = "";
  String result = "0";

  void handleTap(String val) {
    setState(() {
      if (val == "=") {
        try {
          result = input; // Placeholder logic
        } catch (e) {
          result = "Error";
        }
      } else if (val == "C") {
        input = "";
        result = "0";
      } else {
        input += val;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("NeoCasio Ultimate")),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(input, style: TextStyle(fontSize: 24)),
                  Text(result, style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: ["7", "8", "9", "+", "4", "5", "6", "-", "1", "2", "3", "*", "C", "0", "=", "/"]
              .map((e) => ElevatedButton(
                onPressed: () => handleTap(e),
                child: Text(e, style: TextStyle(fontSize: 24)),
                style: ElevatedButton.styleFrom(minimumSize: Size(80, 60)),
              )).toList(),
          ),
        ],
      ),
    );
  }
}
