import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Calculater",
      home: MyCalculater(),
    );
  }
}

class MyCalculater extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Calculater();
}

class Calculater extends State<MyCalculater> {
  final controloer_numberA = TextEditingController();
  final controloer_numberB = TextEditingController();
  final my_form_key = GlobalKey<FormState>();

  String textShow = "";

  void Sum() {
    if (my_form_key.currentState.validate()) {
      int numberA = int.parse(controloer_numberA.text);
      int numberB = int.parse(controloer_numberB.text);
      int result = numberA + numberB;

      setState(() {
        textShow = "$numberA + $numberB = $result";
      });
    }
  }

  void Minus() {
    if (my_form_key.currentState.validate()) {
      int numberA = int.parse(controloer_numberA.text);
      int numberB = int.parse(controloer_numberB.text);
      int result = numberA - numberB;

      setState(() {
        textShow = "$numberA - $numberB = $result";
      });
    }
  }

  void Times() {
    if (my_form_key.currentState.validate()) {
      int numberA = int.parse(controloer_numberA.text);
      int numberB = int.parse(controloer_numberB.text);
      int result = numberA * numberB;

      setState(() {
        textShow = "$numberA * $numberB = $result";
      });
    }
  }

  void Devide() {
    if (my_form_key.currentState.validate()) {
      int numberA = int.parse(controloer_numberA.text);
      int numberB = int.parse(controloer_numberB.text);
      double result = numberA / numberB;

      setState(() {
        textShow = "$numberA / $numberB = $result";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Calculater"),
      ),
      body: Form(
        key: my_form_key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: TextFormField(
                  controller: controloer_numberA,
                  validator: (valueA) {
                    if (valueA.isEmpty) {
                      return "Please input A";
                    }
                  },
                  decoration: InputDecoration(hintText: "Enter Number A"),
                  keyboardType: TextInputType.number),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: TextFormField(
                  controller: controloer_numberB,
                  validator: (valueA) {
                    if (valueA.isEmpty) {
                      return "Please input B";
                    }
                  },
                  decoration: InputDecoration(hintText: "Enter Number B"),
                  keyboardType: TextInputType.number),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
              child: Text(
                textShow,
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: Sum,
                  child: Text("+"),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                  child: RaisedButton(
                    onPressed: Minus,
                    child: Text("-"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                  child: RaisedButton(
                    onPressed: Times,
                    child: Text("x"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                  child: RaisedButton(
                    onPressed: Devide,
                    child: Text("/"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
