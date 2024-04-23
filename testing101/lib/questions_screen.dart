import 'package:flutter/material.dart';
import 'package:testing101/answer_button.dart';
import 'package:testing101/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });

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
    //currentQuestionIndex = currentQuestionIndex + 1;
    //currentQuestionIndex += 1;
    setState(() {
      currentQuestionIndex++; //bætir við einum
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.aleo(
                  color: Color.fromARGB(255, 236, 229, 229),
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: (){
                  answerQuestion(answer);
                },
              );
            })
            /*
            AnswerButton(answerText: currentQuestion.answers[0], onTap: () {}),
            AnswerButton(answerText: currentQuestion.answers[1], onTap: () {}),
            AnswerButton(answerText: currentQuestion.answers[2], onTap: () {}),
            AnswerButton(answerText: currentQuestion.answers[3], onTap: () {}),
            */
          ],
        ),
      ),
    );
  }
}


/*class StartScreen extends StatelessWidget {
  const StartScreen({super.key});
  @override
  Widget build(context) {
    return Center(
      child: Column(children: [
        Image.asset(
          'assets/images/quiz-logo.png',
        width: 300,
        color:Color.fromARGB(98, 65, 116, 226),
        );
        */