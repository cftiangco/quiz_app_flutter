import 'package:flutter/material.dart';
import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(
      {@required this.questions,
      @required this.questionIndex,
      @required this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Question(
        this.questions[this.questionIndex]['questionText'],
      ),
      ...(this.questions[this.questionIndex]['answer']
              as List<Map<String, Object>>)
          .map((answer) {
        return Answer(
            selectHandler: () => this.answerQuestion(answer['score']),
            answer: answer['text']);
      }).toList()
    ]));
  }
}
