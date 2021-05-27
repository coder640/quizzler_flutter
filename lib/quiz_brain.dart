import 'package:quizzler_flutter_app/questions_answers.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<QuestionsAnswers> _allQuesAns = [
    QuestionsAnswers(question: "My name is Khan" , answer: true),
    QuestionsAnswers(question: "I am not a Terrorist" , answer: true),
    QuestionsAnswers(question: "Dog is an Animal's " , answer: true),
    QuestionsAnswers(question: "Hen is an Animal's " , answer: false),
    QuestionsAnswers(question: "Dolphin is an Animal's " , answer: false),
    QuestionsAnswers(question: "Cow is an Animal's " , answer: false),
    QuestionsAnswers(question: "My name is Khan" , answer: true),
    QuestionsAnswers(question: "I am not a Terrorist" , answer: true),
    QuestionsAnswers(question: "Dog is an Animal's " , answer: true),
    QuestionsAnswers(question: "Hen is an Animal's " , answer: false),
    QuestionsAnswers(question: "Dolphin is an Animal's " , answer: false),
    QuestionsAnswers(question: "Cow is an Animal's " , answer: false),



  ];

  void nextQuestion() {
    if (_questionNumber < _allQuesAns.length - 1) {
       _questionNumber++;
    }
  }

  bool isFinished() {
    if (_questionNumber >= _allQuesAns.length -1 ) {
      return true;

    } else {
      return false;
    }

  }

  String getQuestionText() {
    return _allQuesAns[_questionNumber].question;
  }

  bool getQuestionAnswer() {
    return _allQuesAns[_questionNumber].answer;
  }

  int getallQuesAnsLength() {
    return _allQuesAns.length;
  }

  void reset() {
    _questionNumber = 0;
  }


}