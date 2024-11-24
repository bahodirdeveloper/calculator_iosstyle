import 'package:flutter/material.dart';
import 'logic.dart';

void main() {
  runApp(CalculatorApp());
}
class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}
class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}
class _CalculatorScreenState extends State<CalculatorScreen> {
  final CalculatorLogic calculator = CalculatorLogic();
  void buttonPressed(String buttonText) {
    setState(() {
      calculator.handleInput(buttonText);
    });
  }
  Widget buildButton(
      String buttonText,
      Color backgroundColor, {
        Color textColor = Colors.white,
        bool isWide = false,
      }) {
    return Expanded(
      flex: isWide ? 2 : 1, // 0 keng bo'lishi uchun flex ishlatdim
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () => buttonPressed(buttonText),
          child: Container(
            height: MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: isWide ? BoxShape.rectangle : BoxShape.circle,
              borderRadius: isWide ? BorderRadius.circular(50) : null,
            ),
            child: Align(
              alignment: isWide ? Alignment.centerLeft : Alignment.center,
              child: Padding(
                padding: isWide ? const EdgeInsets.only(left: 50.0) : EdgeInsets.zero,
                child: Text(
                  buttonText,
                  style: TextStyle(
                    fontSize: 35.0,
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SF Pro Text',
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // Ekranda natija chiqadigan qismi
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(40.0),
                child: Text(
                  calculator.displayText,
                  style: TextStyle(
                    fontSize: 80,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SF Pro Text',
                  ),
                ),
              ),
            ),
            // Buttonlar qismi
            Column(
              children: [
                Row(
                  children: [
                    buildButton('AC', Colors.grey, textColor: Colors.black),
                    buildButton('±', Colors.grey, textColor: Colors.black),
                    buildButton('%', Colors.grey, textColor: Colors.black),
                    buildButton('÷', Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton('7', Colors.white12),
                    buildButton('8', Colors.white12),
                    buildButton('9', Colors.white12),
                    buildButton('×', Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton('4', Colors.white12),
                    buildButton('5', Colors.white12),
                    buildButton('6', Colors.white12),
                    buildButton('-', Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton('1', Colors.white12),
                    buildButton('2', Colors.white12),
                    buildButton('3', Colors.white12),
                    buildButton('+', Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton('0', Colors.white12, isWide: true),
                    buildButton('.', Colors.white12),
                    buildButton('=', Colors.orange),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
