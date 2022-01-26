import 'question.dart';

List<Question> questions = [
  Question(
    q: "Ernest is 18 years old",
    a: false,
  ),
  Question(
    q: "Ernest has a younger brother and and older sister",
    a: false,
  ),
  Question(
    q: "Ernest is an amazing software developer",
    a: true,
  ),
];

class Quiz {
  List<Question> _questions = [];
  int _questionIndex = 0;

  Quiz({required List<Question> questions}) {
    _questions = questions;
  }

  void nextQuestion() {
    if (_questionIndex < _questions.length - 1) {
      _questionIndex++;
    }
  }

  String getQuestionText() {
    return _questions[_questionIndex].questionText;
  }

  bool getCorrectAnswer() {
    return _questions[_questionIndex].answer;
  }

  bool isFinished() {
    return _questionIndex >= _questions.length - 1;
  }

  void reset() {
    _questionIndex = 0;
  }
}
