import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numbertrivia/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:numbertrivia/injection_container.dart';
import 'package:numbertrivia/number_trivia/presentation/bloc/number_trivia_state.dart';
import 'package:numbertrivia/number_trivia/presentation/widgets/widgets.dart';

class NumberTriviaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Number Trivia App"),
      ),
      body: SingleChildScrollView(child: _blocProvider(context)),
    );
  }

  BlocProvider<NumberTriviaBloc> _blocProvider(BuildContext context) {
    return BlocProvider(
      builder: (_) => sl<NumberTriviaBloc>(),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
              // ignore: missing_return
              builder: (context, state) {
                if (state is InitialState) {
                  return MessageDisplay(
                    message: "Start Searching...",
                  );
                } else if (state is Error) {
                  return MessageDisplay(
                    message: state.message,
                  );
                } else if (state is Loading) {
                  return LoadingDisplay();
                } else if (state is Data) {
                  return TriviaDisplay(trivia: state.trivia);
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
            TriviaControls()
          ],
        ),
      ),
    );
  }
}




