import 'package:biz_card/json_learning/json_learning.dart';
import 'package:biz_card/screen/calculator/calculator_screen.dart';
import 'package:biz_card/screen/movie/home_screen.dart';
import 'package:biz_card/screen/quiz/quiz_screen.dart';
import 'package:biz_card/screen/quotes/quotes.dart';
import 'package:flutter/material.dart';
import 'screen/bizcard/biz_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: JsonPractice.id,
      routes: {
        BizCard.id: (_) => BizCard(),
        Quotes.id: (_) => Quotes(),
        Calculate.id: (_) => Calculate(),
        QuizScreen.id: (_) => QuizScreen(),
        MovieListView.id: (_) => MovieListView(),
        JsonPractice.id: (_) => JsonPractice(),
      },
    );
  }
}
