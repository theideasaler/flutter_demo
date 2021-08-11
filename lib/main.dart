import 'package:flutter/material.dart';

import 'question.dart';
import 'answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final questions = [
    {
      'question': "What's your first pet's name?",
      'answer': ['Rice', 'Four Try'],
    },
    {
      'question': "Whats's your first pet's birthday?",
      'answer': ['2021-01-25', '2021-03-26', '2021-01-08'],
    },
    {
      'question': 'How many pets do you have?',
      'answer': ['1', '2', '3'],
    },
    {
      'question': 'How many times do you feed your pet per day?',
      'answer': ['2', '3', '4', '5'],
    },
  ];
  var _currentQuestionIndex = 0;

  _onConfirmCliked() {
    setState(() {
      _currentQuestionIndex++;
    });
    print(_currentQuestionIndex);
  }

  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Paw Homie'),
        ),
        body: Column(children: [
          Row(children: [
            Expanded(
              child: Question(questions[_currentQuestionIndex]['question']),
            )
          ]),
          ...(questions[_currentQuestionIndex]['answer'] as List<String>)
              .map((ans) => Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Answer(_onConfirmCliked, ans),
                        ),
                      )
                    ],
                  ))
              .toList(),
        ]),
      ),
    );
  }
}
