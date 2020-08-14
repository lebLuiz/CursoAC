
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outroteste/memory.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final _memory = Memory();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          _buildDisplay(),
          Divider(height: 0.1),
          _buildKeyBoard(),
        ],
      ),
    );
  }

  //CRIANDO A CAIXA DE TEXTO(do numero)
  Widget _buildDisplay() {
  return Expanded(
    flex: 1,
    child: Container(
      color: Colors.black87,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AutoSizeText(
              _memory.result,
              minFontSize: 20.0,
              maxFontSize: 80.0,
              maxLines: 1,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
                fontSize: 80.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildKeyBoardButton(String label,
{int flex = 1, Color textColor = Colors.white, Color bakcgroundColor = Colors.black}) {
  return Expanded(
    flex: flex,
    child: RaisedButton(
      color: bakcgroundColor,
      textColor: textColor,
      child: Text(
        label,
        style: TextStyle(fontSize: 24),
      ),
      onPressed: () {
        setState(() {
         _memory.applyCommand(label);
        });
      },
    ),
  );
}

Widget _buildKeyBoard() {
  return Container(
    color: Colors.black,
    height: 400.0,
    child: Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildKeyBoardButton('AC', textColor: Colors.green),
              _buildKeyBoardButton('DEL', textColor: Colors.green),
              _buildKeyBoardButton('%', textColor: Colors.green),
              _buildKeyBoardButton('/', textColor: Colors.green),
            ],
          ),
        ),
        
        Expanded(
          flex: 1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildKeyBoardButton('7'),
              _buildKeyBoardButton('8'),
              _buildKeyBoardButton('9'),
              _buildKeyBoardButton('x', textColor: Colors.green),
            ],
          ),
        ),

        Expanded(
          flex: 1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildKeyBoardButton('4'),
              _buildKeyBoardButton('5'),
              _buildKeyBoardButton('6'),
              _buildKeyBoardButton('+', textColor: Colors.green),
            ],
          ),
        ),

        Expanded(
          flex: 1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildKeyBoardButton('1'),
              _buildKeyBoardButton('2'),
              _buildKeyBoardButton('3'),
              _buildKeyBoardButton('-', textColor: Colors.green),
            ],
          ),
        ),

        Expanded(
          flex: 1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildKeyBoardButton('0', flex: 2),
              _buildKeyBoardButton('.'),
              _buildKeyBoardButton('=', textColor: Colors.green),
            ],
          ),
        ),
      ],
    ),
  );
}
}