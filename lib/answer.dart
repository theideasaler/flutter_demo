import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback onPress;
  final String text;

Answer(this.onPress, this.text);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPress,
        child: Text(text),
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          onPrimary: Colors.white,
        ),
      ),
    );
  }
}
