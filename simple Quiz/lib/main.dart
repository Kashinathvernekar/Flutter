
import 'package:flutter/material.dart';
import './result.dart';
import './quiz.dart';

void main() {
  runApp(MyApp());
}

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
      'questionText': 'What\'s your favorite Actress?',
      'answer': [
        {'text':'MIA','score': 15},
        {'text':'SCARLETT','score': 2},
        {'text':'VINA MALIK','score': 8},
        {'text':'DISHA','score': 5},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answer': [
        {'text':'ELEPHANT', 'score':3},
        {'text':'DOG', 'score':1},
        {'text':'SNAKE', 'score':12},
        {'text':'HYNA', 'score':8},
      ],
    },
    {
      'questionText': 'What\'s your favorite dish?',
      'answer': [
        {'text':'BIRYANI','score':11},
        {'text':'SHIRA','score':1},
        {'text':'CAKE','score':4},
        {'text':'KABAAB','score':8},
      ],
    },
    {
      'questionText': 'What\'s your favorite Actors?',
      'answer': [
        {'text':'JONY','score':15},
        {'text':'SALMAN','score':1},
        {'text':'NAWAJUDDIN','score':8},
        {'text':'RANWIR','score':5},
      ],
    },
    {
      'questionText': 'What\'s your favorite APP?',
      'answer': [
        {'text':'WHATS APP','score':2},
        {'text':'TINDER','score':14},
        {'text':'FACEBOOK','score':5},
        {'text':'INSTAGRAM','score':9},
      ],
    },
  ];
  var _indexQuestion = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
       _indexQuestion = 0;
       _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {

    _totalScore += score;

    setState(() {
      _indexQuestion = _indexQuestion + 1;
    });
    print(_indexQuestion);
    if (_indexQuestion < _questions.length) {
      print("we have more questions!");
    } else {
      print('No more questions');
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('First App'),
        ),
        body: _indexQuestion < _questions.length
            ? Quiz(
                    answerQuestion: _answerQuestion,
                    questionIndex: _indexQuestion,
                    questions: _questions,
                  )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
