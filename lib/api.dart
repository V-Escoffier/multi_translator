import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> getTranslation({
  @required String word,
  @required String languageFrom,
  @required String languageTo,
}) async {
  var url =
      'https://api.mymemory.translated.net/get?q=$word&langpair=$languageFrom|$languageTo';
  var response = await http.get(url);
  //print(response.statusCode);
  if (response.statusCode == 200) {
    //print(response.body);
    String translatedText =
        jsonDecode(response.body)['responseData']['translatedText'];
    return translatedText;
  } else {
    return 'Error with code ${response.statusCode}';
  }
}
