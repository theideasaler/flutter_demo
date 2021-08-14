import 'package:flutter/material.dart';

import 'domain.dart';
import 'quiz.dart';
import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = [
    {
      'question': "What's your first pet's name?",
      'answer': [
        {'text': 'Rice', 'score': 10},
        {'text': 'Four Try', 'score': 3},
      ],
    },
    {
      'question': "Whats's your first pet's birthday?",
      'answer': [
        {'text': '2021-01-25', 'score': 4},
        {'text': '2021-03-26', 'score': 6},
        {'text': '2021-01-08', 'score': 8},
      ],
    },
    {
      'question': 'How many pets do you have?',
      'answer': [
        {'text': '1', 'score': 3},
        {'text': '2', 'score': 5},
        {'text': '3', 'score': 7},
      ],
    },
    {
      'question': 'How many times do you feed your pet per day?',
      'answer': [
        {'text': '3', 'score': 2},
        {'text': '7', 'score': 1},
        {'text': '8', 'score': 4},
      ],
    },
  ];
  var _currentQuestionIndex = 0;
  var _totalScore = 0;

  _onConfirmCliked(int score) {
    setState(() {
      _totalScore += score;
      _currentQuestionIndex++;
    });
    print(_currentQuestionIndex);
  }

  _restartQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
      _totalScore = 0;
    });
  }
  
  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Paw Homie'),
        ),
        body: _currentQuestionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _currentQuestionIndex,
                answerQuestion: _onConfirmCliked,
              )
            : Result(
                text: 'Your Score',
                score: _totalScore,
                restartAction: _restartQuiz,
              ),
      ),
    );
  }
}
