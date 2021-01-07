import 'package:flutter/material.dart';
import 'package:multi_translator/components/language_selectors.dart';
import 'package:multi_translator/api.dart';
import 'package:multi_translator/components/result_line.dart';
import 'package:multi_translator/constants.dart';

enum Language {
  english,
  french,
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String languageSelected = 'fr';

  String translationFR = '';
  String translationEN = '';
  String translationES = '';

  void getTranslations(String word) async {
    String transFR = languageSelected == 'fr'
        ? word
        : await getTranslation(
            word: word, languageFrom: languageSelected, languageTo: 'fr');
    String transEN = languageSelected == 'en'
        ? word
        : await getTranslation(
            word: word, languageFrom: languageSelected, languageTo: 'en');
    String transES = languageSelected == 'es'
        ? word
        : await getTranslation(
            word: word, languageFrom: languageSelected, languageTo: 'es');
    print(translationFR + translationEN + translationES);
    setState(() {
      translationFR = transFR.toLowerCase();
      translationEN = transEN.toLowerCase();
      translationES = transES.toLowerCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multi-translator'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Select a Language to translate from :',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  LanguageSelector(
                    languageFlag: '🇫🇷',
                    onPress: () {
                      setState(() {
                        languageSelected = 'fr';
                      });
                    },
                    colour: languageSelected == 'fr'
                        ? kActiveColor
                        : kInactiveColor,
                  ),
                  LanguageSelector(
                    languageFlag: '🇺🇸',
                    onPress: () {
                      setState(() {
                        languageSelected = 'en';
                      });
                    },
                    colour: languageSelected == 'en'
                        ? kActiveColor
                        : kInactiveColor,
                  ),
                  LanguageSelector(
                    languageFlag: '🇪🇸',
                    onPress: () {
                      setState(() {
                        languageSelected = 'es';
                      });
                    },
                    colour: languageSelected == 'es'
                        ? kActiveColor
                        : kInactiveColor,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(50),
              child: TextField(
                onSubmitted: (wordTyped) async {
                  getTranslations(wordTyped);
                },
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'Word to translate',
                  icon: Icon(Icons.search),
                ),
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Result(
                    translationWord: translationFR,
                    flag: '🇫🇷',
                  ),
                  Result(
                    translationWord: translationEN,
                    flag: '🇺🇸',
                  ),
                  Result(
                    translationWord: translationES,
                    flag: '🇪🇸',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
