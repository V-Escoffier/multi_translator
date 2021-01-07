import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  Result({@required this.translationWord, this.flag});
  final String translationWord;
  final String flag;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 80, right: 10),
      child: Row(
        children: <Widget>[
          Text(
            '$flag  ',
            style: TextStyle(fontSize: 32.0),
          ),
          Expanded(
            child: Text(
              '$translationWord',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ],
      ),
    );
  }
}
