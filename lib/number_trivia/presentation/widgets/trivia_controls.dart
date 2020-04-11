
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numbertrivia/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:numbertrivia/number_trivia/presentation/bloc/number_trivia_event.dart';
import 'package:flutter/material.dart';

class TriviaControls extends StatefulWidget {
  const TriviaControls({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TriviaControlsState();
}

class _TriviaControlsState extends State<TriviaControls> {
  String inputStr;
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          onSubmitted: (_) {
            dispatchConcreteNumberTrivia();
          },
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              border: OutlineInputBorder(), hintText: "Input a number"),
          onChanged: (input) {
            inputStr = input;
          },
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: RaisedButton(
                child: Text("Search"),
                color: Theme.of(context).accentColor,
                textTheme: ButtonTextTheme.primary,
                onPressed: dispatchConcreteNumberTrivia,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: RaisedButton(
                child: Center(child: Text("Get random trivia")),
                textTheme: ButtonTextTheme.primary,
                onPressed: dispatchRandomNumberTrivia,
              ),
            )
          ],
        ),
      ],
    );
  }

  void dispatchConcreteNumberTrivia() {
    controller.clear();
    BlocProvider.of<NumberTriviaBloc>(context)
        .dispatch(GetConcreteNumberEvent(inputStr));
  }

  void dispatchRandomNumberTrivia() {
    controller.clear();
    BlocProvider.of<NumberTriviaBloc>(context).dispatch(GetRandomNumberEvent());
  }
}