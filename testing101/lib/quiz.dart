import 'package:flutter/material.dart';
import 'package:testing101/start_screen.dart';
import 'package:testing101/questions_screen.dart';
import 'package:testing101/data/questions.dart';
import 'package:testing101/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

/* void initState() {
  activeScreen = StartScreen(switchScreen);
    super.initState();
  }*/
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

void restartQuiz() {
  setState(() {
    selectedAnswers = [];
    activeScreen = 'questions-screen';
  });
}


  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }
    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }
/*
    if (activeScreen == 'questions-screen'){
    screenWidget = QuestionsScreen();
    }
  */
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(40, 175, 96, 1),
                Color.fromRGBO(148, 23, 238, 1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}




/*MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: LinearGradient(
            colors: [
              Color.fromRGBO(103, 58, 183, 1),
              Color.fromRGBO(153, 58, 223, 1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            ),
            ),
          child: StartScreen(
          ),
        ),
        ),
  ),
  */