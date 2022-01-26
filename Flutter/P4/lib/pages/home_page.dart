import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String equation = "0";
  String result = "0";
  String expression = "";

  buttonPressed(String s) {
    if (s == "C") {
      equation = "0";
      result = "0";
    } else {
      if (s == "⌫") {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else {
        if (s == "=") {
          expression = equation;
          expression = expression.replaceAll("÷", "/");
          expression = expression.replaceAll("×", "*");

          try {
            Parser p = Parser();
            Expression exp = p.parse(expression);

            ContextModel cm = ContextModel();
            result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          } catch (e) {
            result = "Error";
          }
          equation = result; //proceed after result
        } else {
          if (equation == "0") {
            equation = s;
          } else {
            equation = equation + s;
          }
        }
      }
    }
    setState(() {});
  }

  Widget buildButton(
      String buttonText, double buttonHeight, Color buttonColor) {
    return GestureDetector(
      onTap: () {
        buttonPressed(buttonText);
      },
      child: Container(
        height: 75.0 * buttonHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          border: Border.all(color: Colors.white),
          color: buttonColor,
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
        ),
        body: Column(children: <Widget>[
          Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Text(
                equation,
                style: TextStyle(fontSize: 30.0),
              )),
          Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Text(
                result,
                style: TextStyle(fontSize: 50.0),
              )),
          Expanded(child: Divider()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 309.0,
                child: Table(
                  children: [
                    TableRow(children: [
                      buildButton("C", 1, Colors.red),
                      buildButton("⌫", 1, Colors.blue),
                      buildButton("÷", 1, Colors.blue),
                    ]),
                    TableRow(children: [
                      buildButton("7", 1, Colors.black45),
                      buildButton("8", 1, Colors.black45),
                      buildButton("9", 1, Colors.black45),
                    ]),
                    TableRow(children: [
                      buildButton("4", 1, Colors.black45),
                      buildButton("5", 1, Colors.black45),
                      buildButton("6", 1, Colors.black45),
                    ]),
                    TableRow(children: [
                      buildButton("1", 1, Colors.black45),
                      buildButton("2", 1, Colors.black45),
                      buildButton("3", 1, Colors.black45),
                    ]),
                    TableRow(children: [
                      buildButton(".", 1, Colors.black45),
                      buildButton("0", 1, Colors.black45),
                      buildButton("00", 1, Colors.black45),
                    ]),
                  ],
                ),
              ),
              Container(
                width: 102,
                child: Table(
                  children: [
                    TableRow(children: [
                      buildButton("×", 1, Colors.blue),
                    ]),
                    TableRow(children: [
                      buildButton("-", 1, Colors.blue),
                    ]),
                    TableRow(children: [
                      buildButton("+", 1, Colors.blue),
                    ]),
                    TableRow(children: [
                      buildButton("=", 2, Colors.red),
                    ]),
                  ],
                ),
              )
            ],
          )
        ]));
  }
}
