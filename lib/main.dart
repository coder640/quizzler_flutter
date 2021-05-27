import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quizzler_flutter_app/questions_answers.dart';
import 'package:quizzler_flutter_app/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(Quizler());
}

class Quizler extends StatefulWidget {
  const Quizler({Key key}) : super(key: key);

  @override
  _QuizlerState createState() => _QuizlerState();
}

class _QuizlerState extends State<Quizler> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade800,
          title: Text("Quiz App"),
          centerTitle: true,
        ),
        backgroundColor: Colors.grey.shade700,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];

  // List<bool> correctAnswers = [true , true , false ];
  //
  // List<String> questions = [
  //   "My name is Khan",
  //   "I am not a Terrorist",
  //   "Cow is an Animal's ",
  // ];
  QuizBrain quizBrain = QuizBrain();

  // Questions ques1 = Questions(question: "My name is Khan" , answer: true);

  void checkAnswer(bool userPickedAnswer) {
    bool answer = quizBrain.getQuestionAnswer();
    setState(() {

      if (quizBrain.isFinished() == true) {
        Alert(context: context, title: "Finished", desc: "You Finished the quiz", buttons: [
          DialogButton(
            child: Text("Ok"),
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(116, 116, 191, 1.0),
                Color.fromRGBO(52, 138, 199, 1.0)
              ]
            ),
          ),
          DialogButton(
            child: Text("Close"),
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(116, 116, 191, 1.0),
                Color.fromRGBO(52, 138, 199, 1.0)
              ]
            ),
          )
        ]).show();

        scoreKeeper = [];
        quizBrain.reset();


      }

      else {
        if (userPickedAnswer == answer) {
          scoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
          // setState(() {
          //
          //
          //   // if (quizBrain.getallQuesAnsLength() > questionNumber) {
          //   //   questionNumber+= 1;
          //   // }
          //   // else {
          //   // }
          // });
          // print(quizBrain.getallQuesAnsLength());
        } else {
          scoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
          // setState(() {
          //
          //   quizBrain.nextQuestion();
          //   // if (quizBrain.getallQuesAnsLength() > questionNumber) {
          //   //   questionNumber+= 1;
          //   // }
          //   // else {
          //   // }
          // });
          // print(quizBrain.getallQuesAnsLength());
        }
        quizBrain.nextQuestion();
      }




    });


  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 7,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              onPressed: () {
                checkAnswer(true);
              },
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                "True",
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              onPressed: () {
                checkAnswer(false);
              },
              textColor: Colors.white,
              color: Colors.red,
              child: Text(
                "False",
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: scoreKeeper,
          ),
        ),
      ],
    );
  }
}
