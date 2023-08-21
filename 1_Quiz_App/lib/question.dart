import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class Question extends StatefulWidget {
  const Question({super.key, required this.onSelectedAnswer});

  final void Function(String answer) onSelectedAnswer;

  @override
  State<Question> createState() {
    return _Question();
  }
}

class _Question extends State<Question> {
  var currentQueIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectedAnswer(selectedAnswer);
    // here we used "widget." to call functions from statefulwidget
    setState(() {
      currentQueIndex++;
    });
  }

  @override
  Widget build(context) {
    final currebtQue = questions[currentQueIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currebtQue.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 158, 241, 223),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),

            ...currebtQue.getSuffledAnswers().map((answer) {
              return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    answerQuestion(answer);
                  });
            }),
            // taking the current question as a map and converting them into AnswerButton() widget
            // and by '...' we are seperating them into comma seperated widget

            // AnswerButton(
            //   answerText: currebtQue.answers[0],
            //   onTap: () {},
            // ),
            // AnswerButton(
            //   answerText: currebtQue.answers[1],
            //   onTap: () {},
            // ),
            // AnswerButton(
            //   answerText: currebtQue.answers[2],
            //   onTap: () {},
            // ),
            // AnswerButton(
            //   answerText: currebtQue.answers[3],
            //   onTap: () {},
            // ),
          ],
        ),
      ),
    );
  }
}
