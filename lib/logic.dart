import 'dart:math';
class CalculatorLogic {
  String _displayText = '0';
  double? _firstOper;
  String? _operator;
  bool _shouldClear = false;
  String get displayText => _displayText;
  void handleInput(String input) {
    if (input == 'AC') {
      _clear();
    } else if (input == '±') {
      _plusminus();
    } else if (input == '%') {
      _calcfoiz();
    } else if (input == '÷' || input == '×' || input == '-' || input == '+') {
      _setOperator(input);
    } else if (input == '=') {
      _calculateResult();
    } else {
      _appendDigit(input);
    }
  }
  void _clear() {
    _displayText = '0';
    _firstOper = null;
    _operator = null;
    _shouldClear = false;
  }
  void _plusminus() {
    if (_displayText != '0') {
      if (_displayText.startsWith('-')) {
        _displayText = _displayText.substring(1);
      } else {
        _displayText = '-$_displayText';
      }
    }
  }
  void _calcfoiz() {
    final value = double.tryParse(_displayText) ?? 0;
    _displayText = (value / 100).toString();
  }
  void _setOperator(String operator) {
    _firstOper = double.tryParse(_displayText);
    _operator = operator;
    _shouldClear = true;
  }
  void _calculateResult() {
    if (_firstOper == null || _operator == null) return;
    final secondOper = double.tryParse(_displayText) ?? 0;
    double result = 0;
    switch (_operator) {
      case '÷':
        result = _firstOper! / secondOper;
        break;
      case '×':
        result = _firstOper! * secondOper;
        break;
      case '-':
        result = _firstOper! - secondOper;
        break;
      case '+':
        result = _firstOper! + secondOper;
        break;
    }
    _displayText = result.toString();
    _firstOper = null;
    _operator = null;
    _shouldClear = true;
  }
  void _appendDigit(String digit) {
    if (_shouldClear) {
      _displayText = digit;
      _shouldClear = false;
    } else {
      if (_displayText == '0' && digit != '.') {
        _displayText = digit;
      } else {
        _displayText += digit;
      }
    }
  }
}
