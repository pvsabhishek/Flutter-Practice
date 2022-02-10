import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';

// import './question.dart';
// import './answer.dart';
import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 7},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animals?',
      'answers': [
        {'text': 'Lion', 'score': 6},
        {'text': 'Tiger', 'score': 8},
        {'text': 'Dog', 'score': 10},
        {'text': 'Cat', 'score': 2},
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'LoveBabber', 'score': 8},
        {'text': 'Effcon', 'score': 9},
        {'text': 'CodeWithMosh', 'score': 3},
        {'text': 'CodeWithHarry', 'score': 10},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    // var aBool = true;
    // aBool = false;
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions! ');
    } else {
      print('No more question');
    }
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = ['Hello'];
    // dummy.add('Max');
    // print(dummy);

    // questions = [] // does not work if question is a const

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
