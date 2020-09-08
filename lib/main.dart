import 'package:biz_card/screen/calculator_screen.dart';
import 'package:biz_card/screen/quiz_screen.dart';
import 'package:biz_card/screen/quotes.dart';
import 'package:flutter/material.dart';
import 'screen/biz_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: QuizScreen.id,
      routes: {
        BizCard.id: (_) => BizCard(),
        Quotes.id: (_) => Quotes(),
        Calculate.id: (_) => Calculate(),
        QuizScreen.id: (_) => QuizScreen()
      },
    );
  }
}
