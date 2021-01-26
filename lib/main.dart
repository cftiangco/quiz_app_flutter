import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State {
  final _questions = [
    {
      'questionText': "What's your favorite color?",
      'answer': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ]
    },
    {
      'questionText': "What's your favorite Animal?",
      'answer': [
        {'text': 'Dog', 'score': 10},
        {'text': 'Cat', 'score': 5},
        {'text': 'Lion', 'score': 3},
        {'text': 'Elephant', 'score': 1}
      ]
    },
    {
      'questionText': "Who's your favorite Instructor?",
      'answer': [
        {'text': 'Max', 'score': 10},
        {'text': 'Colt', 'score': 5},
        {'text': 'Angela', 'score': 3},
        {'text': 'Brad', 'score': 1}
      ]
    }
  ];

  int _questionIndex = 0;
  int _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion)
            : Result(
                _totalScore,
                _resetQuiz,
              ),
      ),
    );
  }
}
