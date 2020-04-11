
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:numbertrivia/number_trivia/domain/entities/number_trivia.dart';

class TriviaDisplay extends StatelessWidget {
  final NumberTrivia trivia;

  const TriviaDisplay({Key key, @required this.trivia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Column(
        children: <Widget>[
          Text(
            trivia.number.toString(),
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: Center(
                child: SingleChildScrollView(
                    child: Text(
                      trivia.text,
                      style: TextStyle(fontSize: 30),
                      textAlign: TextAlign.center,
                    ))),
          ),
        ],
      ),
    );
  }
}
