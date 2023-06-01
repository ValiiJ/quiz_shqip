import 'package:flutter/material.dart';
import 'package:quiz_shqip/questions_screen.dart';
import 'package:quiz_shqip/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  //e kem deklaru variablen qe
//activescreen osht i barabart me start-screen

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
      //ne qofrse activecreen osht i barabart me 'start-screen' at here na dergon te
      //njejta e qe na dergon tek actvescreen neqoftse  nuk eshte e njejta variabel e qe ktu e kem
      //deklaru tjeter variabel
      // at here dergona te tjetri screen tek questions-screen
      //e qe posht mandej e thirrum ket.@404
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = const QuestionsScreen();
    }

    // @404
    //ose kjo medote
    // final screnWidget = activecreen == 'start-screen'
    //     //tek variabla nalt e ken deklaru qe activescreen osht e barabart me start-screen
    //     // ne qoftse osht e barabart at here dergona tek StartScreen(switchScreen)

    //     ? StartScreen(switchScreen)
    //     // neqoftse jo at here dergona tek
    //     : const QuestionsScreen();
    // //QuestionsScreen(),

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.red,
              ],
              end: Alignment.bottomRight,
              begin: Alignment.topRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
