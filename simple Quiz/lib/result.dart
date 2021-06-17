import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function resetHandler;

  Result(this.totalScore, this.resetHandler);

  String get resultPhrase{
    String resultText;
    if(totalScore <= 8){
      resultText = 'You are awesome and innocent!';
    }else if(totalScore <= 12){
      resultText = 'Pretty likable!';
    }else if(totalScore <= 16){
      resultText = 'you are strange.....?!';
    }else {
      resultText = 'You are bad!';
    }
    return resultText;
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
           Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: resetHandler,
            child: Text(
              'Restart Quiz',
              style: TextStyle(fontSize: 15),
            ),
            textColor: Colors.lightBlue,
          ),
        ],
      ),
    );
  }
}
