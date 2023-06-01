import 'package:flutter/material.dart';
import 'package:quiz_shqip/answer_button.dart';
import 'package:quiz_shqip/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion() {
    // currentQuestionIndex = currentQuestionIndex + 1;ose
    currentQuestionIndex += 1;
  }

  @override
  Widget build(context) {
    final currenQuestion = questions[0];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currenQuestion.text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currenQuestion.getShuffleAnswer().map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {},
              );
            }),
          ],
        ),
      ),
    );
  }
}
