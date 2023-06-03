import 'package:flutter/material.dart';
import 'package:quiz_shqip/answer_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_shqip/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);

    // currentQuestionIndex = currentQuestionIndex + 1;ose
    // currentQuestionIndex += 1;
    setState(() {
      currentQuestionIndex++; //increments the value by 1
    });
  }

  @override
  Widget build(context) {
    final currenQuestion = questions[currentQuestionIndex];
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
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 238, 227, 227),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currenQuestion.getShuffleAnswer().map((answer) {
              return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    answerQuestion(answer);
                  });
            }),
          ],
        ),
      ),
    );
  }
}
