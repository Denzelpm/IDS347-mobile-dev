import 'package:quiz_app/question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Questions> _questionBank = [
    Questions('The Great Wall of China is visible from the moon.', false),
    Questions('French is an official language in Canada.', true),
    Questions('Nutella is produced by the German company Ferrero.', false),
    Questions('A scientific study on peanuts in bars found traces of over 100 unique specimens of urine.', false),
    Questions('Bulls are attracted to the color red.', false),
    Questions('The Sun rises from the North.', false),
    Questions('On average, at least 1 person is killed by a drunk driver in the United States every hour.', true),
    Questions('Pluto is a planet.', false),
    Questions('27 Club; is a term used to refer to a list of famous actors, musicians, and artists who died at the age of 27.', true),
    Questions('Scotland voted to become an independent country during the referendum from September 2014.', false),
    Questions('A pasodoble is a type of Italian pasta sauce.', false),
    Questions('The mitochondria is the powerhouse of the cell.', true),
  ];

  void getNextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestion() {
    return _questionBank[_questionNumber].question;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].answer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1)
      return true;
    else
      return false;
  }

  void reset() {
    _questionNumber = 0;
  }
}