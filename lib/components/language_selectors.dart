import 'package:flutter/material.dart';

class LanguageSelector extends StatelessWidget {
  LanguageSelector({this.languageFlag, this.onPress, this.colour});

  final String languageFlag;
  final Function onPress;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: colour,
      onPressed: onPress,
      child: Text(
        languageFlag,
        style: TextStyle(fontSize: 32.0),
      ),
    );
  }
}
