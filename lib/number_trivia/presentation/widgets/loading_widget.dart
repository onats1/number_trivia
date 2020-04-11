import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LoadingDisplay extends StatelessWidget {
  const LoadingDisplay({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 3,
        child: Center(child: CircularProgressIndicator()));
  }
}