import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyCalc());

class MyCalc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "",
      home: Calc(),
    );
  }
}

class Calc extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Calc();
  }
}

class _Calc extends State<Calc> {
  String text = '0';
  String result = '0';
  String finalresult = '0';
  double numOne = 0;
  double numTwo = 0;
  String opr = '';
  String preOpr = '';
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: null,
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(
                      text,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                      ),
                      maxLines: 1,
                      textAlign: TextAlign.right,
                    ))
              ],
            ),
            Row(
              children: [
                button("AC", Colors.grey, Colors.black, 1),
                button("+/-", Colors.grey, Colors.black, 1),
                button("%", Colors.grey, Colors.black, 1),
                button("/", Colors.amber, Colors.white, 1),
              ],
            ),
            Row(
              children: [
                button("7", Colors.grey, Colors.white, 1),
                button("8", Colors.grey, Colors.white, 1),
                button("9", Colors.grey, Colors.white, 1),
                button("X", Colors.amber, Colors.white, 1),
              ],
            ),
            Row(
              children: [
                button("4", Colors.grey, Colors.white, 1),
                button("5", Colors.grey, Colors.white, 1),
                button("6", Colors.grey, Colors.white, 1),
                button("-", Colors.amber, Colors.white, 1),
              ],
            ),
            Row(
              children: [
                button("1", Colors.grey, Colors.white, 1),
                button("2", Colors.grey, Colors.white, 1),
                button("3", Colors.grey, Colors.white, 1),
                button("+", Colors.amber, Colors.white, 1),
              ],
            ),
            Row(
              children: [
                button("0", Colors.grey, Colors.white, 0),
                button(".", Colors.grey, Colors.white, 1),
                button("=", Colors.amber, Colors.white, 1),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget button(String btnTxt, Color color, Color txtColor, int num) {
    Container container;

    if (num == 0) {
      container = Container(
        padding: EdgeInsets.only(bottom: 10),
        child: RaisedButton(
          onPressed: () {
            calculate(btnTxt);
          },
          child: Text(
            btnTxt,
            style: TextStyle(
              color: txtColor,
            ),
          ),
          color: color,
          padding: EdgeInsets.only(top: 20, bottom: 20, right: 83, left: 83),
          shape: StadiumBorder(),
        ),
      );
    }
    else {
      container = Container(
        padding: EdgeInsets.only(bottom: 10),
        child: RaisedButton(
          onPressed: () {
            calculate(btnTxt);
          },
          child: Text(
            btnTxt,
            style: TextStyle(
              color: txtColor,
            ),
          ),
          color: color,
          padding: EdgeInsets.all(20),
          shape: CircleBorder(),
        ),
      );
    }
    return container;
  }

  void calculate(txtbtn) {
    if (txtbtn == "AC") {
      text = '0';
      result = '0';
      finalresult = '0';
      numOne = 0;
      numTwo = 0;
      opr = '';
      preOpr = '';
    } else if (opr == "=" && txtbtn == "=") {
      switch (preOpr) {
        case"+":
          finalresult = add();
          break;
        case"-":
          finalresult = sub();
          break;
        case"X":
          finalresult = mul();
          break;
        case"/":
          finalresult = div();
          break;
      }
    }

    else if (txtbtn == "+" || txtbtn == "-" || txtbtn == "X" || txtbtn == "/" ||
        txtbtn == "=") {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }
      switch (opr) {
        case"+":
          finalresult = add();
          break;
        case"-":
          finalresult = sub();
          break;
        case"X":
          finalresult = mul();
          break;
        case"/":
          finalresult = div();
          break;
      }
      preOpr = opr;
      opr = txtbtn;
      result = '';
    }
    else if (txtbtn == "%"){
      result = (numOne/100).toString();
      finalresult = result; 
    }
    else {
      if (result == "0") {
        result = txtbtn;
      }
      else {
        result = result + txtbtn;
        finalresult = result;
      }
      setState(() {
        text = finalresult;
      });
    }
  }
    String add() {
      result = (numOne + numTwo).toString();
      numOne = double.parse(result);
      return result;
    }
    String sub() {
      result = (numOne - numTwo).toString();
      numOne = double.parse(result);
      return result;
    }
    String mul() {
      result = (numOne * numTwo).toString();
      numOne = double.parse(result);
      return result;
    }
    String div() {
      result = (numOne / numTwo).toString();
      numOne = double.parse(result);
      return result;
    }
  }
