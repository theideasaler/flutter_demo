import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Result extends StatelessWidget {
  final String text;
  final int score;
  final VoidCallback restartAction;

  String get resultText {
    return '$score';
  }

  const Result(
      {Key? key,
      required this.text,
      required this.score,
      required this.restartAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                resultText,
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: restartAction,
                icon: Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
                label: Text('Restart'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
