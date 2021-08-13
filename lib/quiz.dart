import 'package:flutter/material.dart';

import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    required this.questions,
    required this.questionIndex,
    required this.answerQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(children: [
          Expanded(
            child: Question(questions[questionIndex]['question'] as String),
          )
        ]),
        ...(questions[questionIndex]['answer'] as List<Map<String, Object>>)
            .map((ans) => Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Answer(
                          () => answerQuestion(ans['score']),
                          ans['text'] as String,
                        ),
                      ),
                    )
                  ],
                ))
            .toList(),
      ]),
    );
  }
}
