import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}
class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorUI(),
    );
  }
}
class CalculatorUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Ekrandagi raqamlarni ko'rsatish joyi
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                '0',
                style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Tugmalar grid qismi
            Expanded(
              child: Column(
                children: [
                  _buildButtonRow(['AC', '±', '%', '÷'], Colors.grey, Colors.orange),
                  _buildButtonRow(['7', '8', '9', '×'], Colors.white12, Colors.orange),
                  _buildButtonRow(['4', '5', '6', '-'], Colors.white12, Colors.orange),
                  _buildButtonRow(['1', '2', '3', '+'], Colors.white12, Colors.orange),
                  _buildLastRow(['0', '.', '='], Colors.white12, Colors.orange),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Tugmalar uchun bitta qatordagi qator
  Widget _buildButtonRow(List<String> texts, Color numberColor, Color operatorColor) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: texts.map((text) {
          final isOperator = text == '÷' || text == '×' || text == '-' || text == '+' || text == '=';
          return _calcButton(
            text,
            isOperator ? operatorColor : numberColor,
          );
        }).toList(),
      ),
    );
  }

  // So'nggi qatordagi "0", "." va "=" tugmalari
  Widget _buildLastRow(List<String> texts, Color numberColor, Color operatorColor) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: _calcButton('0', numberColor),
          ),
          Expanded(
            child: _calcButton('.', numberColor),
          ),
          Expanded(
            child: _calcButton('=', operatorColor),
          ),
        ],
      ),
    );
  }

  // Har bir tugma uchun widget
  Widget _calcButton(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: AspectRatio(
        aspectRatio: 1, // Tugmalarni kvadrat shaklda qiladi
        child: Container(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: text == '÷' || text == '×' || text == '-' || text == '+' || text == '='
                    ? Colors.white
                    : Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}