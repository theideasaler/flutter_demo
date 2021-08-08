import 'package:flutter/material.dart';

import './question.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _currentQuestionIndex = 0;

  _onConfirmCliked() {
    setState(() {
      _currentQuestionIndex++;
    });
    print(_currentQuestionIndex);
  }

  @override
  Widget build(BuildContext ctx) {
    var questions = [
      "What's your first pet's name?",
      "Whats's your first pet's birthday?",
      "How many pets do you have?",
      "How many times do you feed your pet per day?",
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Paw Homie'),
        ),
        body: Column(children: [
          Row(children: [
            Expanded(
              child: Question(questions[_currentQuestionIndex]),
            )
          ]),
          Row(
            children: [
              Expanded(
                child: Center(
                  child: ElevatedButton(
                    onPressed: _onConfirmCliked,
                    child: Text('Confirm'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue, onPrimary: Colors.white),
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
