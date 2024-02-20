import 'package:flutter/material.dart';
import 'common_widgets.dart';

class CalculatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Center(
        child: CalculatorScreen(),
      ),
      drawer: CommonDrawer(),
      bottomNavigationBar: CommonBottomNavigationBar(currentIndex: 1),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = '0';
  String _input = '';
  double _num1 = 0;
  String _operator = '';
  bool _reset = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            _output,
            style: TextStyle(fontSize: 36, color: Colors.pink),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildButton('7'),
            _buildButton('8'),
            _buildButton('9'),
            _buildOperatorButton('/'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildButton('4'),
            _buildButton('5'),
            _buildButton('6'),
            _buildOperatorButton('*'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildButton('1'),
            _buildButton('2'),
            _buildButton('3'),
            _buildOperatorButton('-'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildButton('0'),
            _buildButton('.'),
            _buildEqualsButton(),
            _buildOperatorButton('+'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildClearButton(),
            _buildPercentageButton(),
            _buildBackspaceButton(),
          ],
        ),
      ],
    );
  }

  Widget _buildButton(String text) {
    return ElevatedButton(
      onPressed: () => _onButtonPressed(text),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Colors.blueGrey,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  Widget _buildOperatorButton(String text) {
    return ElevatedButton(
      onPressed: () => _onOperatorPressed(text),
      style: ElevatedButton.styleFrom(
        primary: Colors.blueAccent,
        onPrimary: Colors.white,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  Widget _buildEqualsButton() {
    return ElevatedButton(
      onPressed: _onEqualsPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.green,
        onPrimary: Colors.white,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: Text(
        '=',
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  Widget _buildClearButton() {
    return ElevatedButton(
      onPressed: _onClearPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.orange,
        onPrimary: Colors.white,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: Text(
        'C',
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  Widget _buildPercentageButton() {
    return ElevatedButton(
      onPressed: _onPercentagePressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.blueAccent,
        onPrimary: Colors.white,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: Text(
        '%',
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  Widget _buildBackspaceButton() {
    return ElevatedButton(
      onPressed: _onBackspacePressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.black,
        onPrimary: Colors.white,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: Icon(Icons.backspace),
    );
  }

  void _onButtonPressed(String text) {
    setState(() {
      if (_reset) {
        _input = '';
        _reset = false;
      }
      _input += text;
      _output = _input;
    });
  }

  void _onOperatorPressed(String operator) {
    setState(() {
      if (_reset) {
        _reset = false;
      }
      _num1 = double.parse(_input);
      _operator = operator;
      _input += ' $_operator ';
    });
  }

  void _onEqualsPressed() {
    setState(() {
      double num2 = double.parse(_input.split(' $_operator ')[1]);
      switch (_operator) {
        case '+':
          _input += ' = ${_num1 + num2}';
          break;
        case '-':
          _input += ' = ${_num1 - num2}';
          break;
        case '*':
          _input += ' = ${_num1 * num2}';
          break;
        case '/':
          if (num2 != 0) {
            _input += ' = ${_num1 / num2}';
          } else {
            _input = 'Error';
          }
          break;
      }
      _reset = true;
      _output = _input;
    });
  }

  void _onClearPressed() {
    setState(() {
      _input = '';
      _output = '0';
      _num1 = 0;
      _operator = '';
    });
  }

  void _onPercentagePressed() {
    setState(() {
      double num = double.parse(_input);
      _input = (num / 100).toString();
      _output = _input;
    });
  }

  void _onBackspacePressed() {
    setState(() {
      if (_input.length > 0) {
        _input = _input.substring(0, _input.length - 1);
        _output = _input;
      }
    });
  }
}

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Calculator',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: CalculatorScreen(),
    );  
  }
}
