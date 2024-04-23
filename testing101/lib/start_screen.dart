import 'package:flutter/material.dart';


class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,{super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(children: [
        Image.asset(
          'assets/images/quiz-logo.png',
        width: 300,
        color:Color.fromARGB(199, 233, 129, 10),
        ),
        const SizedBox(height: 80),
        const Text(
          'Flutter Quiz!!',
        style: TextStyle(
          color: Color.fromARGB(255, 226, 133, 46),
          fontSize:34
        )
        ),
        const SizedBox(
          height:30
          ),
          OutlinedButton.icon(
            onPressed: () {
              startQuiz();
            },
          style:OutlinedButton.styleFrom(
            foregroundColor: Colors.white
          ),
          icon: const Icon(Icons.arrow_right_alt_outlined),
          label: const Text(
            '- START QUIZ -'
            )
            ),
          /*Image.asset(
          'assets/images/aitubo.jpg',
          width:300
          ),*/
          ],
      ),
      );
  }
}