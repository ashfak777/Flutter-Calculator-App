import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './calculator_buttons/Buttons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State<MyApp> {
  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() => _expression += text);
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Scaffold(
        backgroundColor: Color(0xFF283637),
        body: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    _history,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 24,
                        color: Color(0xFF545F61),
                      ),
                    ),
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    _expression,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Buttons(
                    text: 'AC',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF4CAF50,
                    textSize: 20,
                    callback: allClear,
                  ),
                  Buttons(
                    text: 'C',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF4CAF50,
                    callback: clear,
                  ),
                  Buttons(
                    text: '%',
                    fillColor: 0xFF4CAF50,
                    textColor: 0xFFFFFFFF,
                    callback: numClick,
                  ),
                  Buttons(
                    text: '/',
                    fillColor: 0xFF4CAF50,
                    textColor: 0xFFFFFFFF,
                    callback: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Buttons(
                    text: '7',
                    callback: numClick,
                  ),
                  Buttons(
                    text: '8',
                    callback: numClick,
                  ),
                  Buttons(
                    text: '9',
                    callback: numClick,
                  ),
                  Buttons(
                    text: '*',
                    fillColor: 0xFF4CAF50,
                    textColor: 0xFFFFFFFF,
                    textSize: 24,
                    callback: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Buttons(
                    text: '4',
                    callback: numClick,
                  ),
                  Buttons(
                    text: '5',
                    callback: numClick,
                  ),
                  Buttons(
                    text: '6',
                    callback: numClick,
                  ),
                  Buttons(
                    text: '-',
                    fillColor: 0xFF4CAF50,
                    textColor: 0xFFFFFFFF,
                    textSize: 38,
                    callback: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Buttons(
                    text: '1',
                    callback: numClick,
                  ),
                  Buttons(
                    text: '2',
                    callback: numClick,
                  ),
                  Buttons(
                    text: '3',
                    callback: numClick,
                  ),
                  Buttons(
                    text: '+',
                    fillColor: 0xFF4CAF50,
                    textColor: 0xFFFFFFFF,
                    textSize: 30,
                    callback: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Buttons(
                    text: '.',
                    callback: numClick,
                  ),
                  Buttons(
                    text: '0',
                    callback: numClick,
                  ),
                  Buttons(
                    text: '00',
                    callback: numClick,
                    textSize: 26,
                  ),
                  Buttons(
                    text: '=',
                    fillColor: 0xFF4CAF50,
                    textColor: 0xFFFFFFFF,
                    callback: evaluate,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
