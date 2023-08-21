import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeAsset extends StatelessWidget {
  const HomeAsset(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Text(
              'Learn Flutter the fun way!',
              style: GoogleFonts.caveat(
                color: const Color.fromARGB(255, 205, 129, 255),
                fontSize: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: OutlinedButton.icon(
              onPressed: () {
                startQuiz();
              },
              icon: const Icon(Icons.arrow_right_alt, color: Colors.white),
              label: const Text(
                "Start Quiz",
                style: TextStyle(color: Color.fromARGB(255, 221, 232, 250)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
