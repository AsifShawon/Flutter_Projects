import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/home_assets.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> {
  static const Color c1 = Color.fromARGB(255, 88, 47, 184),
      c2 = Color.fromARGB(255, 83, 49, 177);

  // Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen = HomeAsset(changeScreen);
  //   super.initState();
  // }

  List<String> selectedAnswers = []; // list of selected answers by user
  var activeScreen = 'home-asset';

  void changeScreen() {
    setState(() {
      activeScreen = 'question';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    // adding selected answers by user every time user selects an answer

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = HomeAsset(changeScreen); // by default -> home screen

    //
    if (activeScreen == 'question') {
      currentScreen = Question(onSelectedAnswer: chooseAnswer);
    }
    if (activeScreen == 'result-screen') {
      currentScreen = ResultScreen(
        chosenAnswers: selectedAnswers,
        startQuiz: changeScreen,
      );
      selectedAnswers = [];
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [c1, c2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: currentScreen,
          // child: activeScreen == 'home-asset'
          //     ? HomeAsset(changeScreen)
          //     : Question(
          //         onSelectedAnswer: chooseAnswer,
          //       ),
        ),
      ),
    );
  }
}
