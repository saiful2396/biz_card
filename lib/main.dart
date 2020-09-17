import 'package:biz_card/json_learning/ui/json_learning.dart';
import 'package:biz_card/quiz_app/ui/quiz_screen.dart';
import 'package:biz_card/quotes/quotes.dart';
import 'bizcard/biz_card.dart';
import 'calculator/calculator_screen.dart';
import 'package:flutter/material.dart';
import 'lazy_loading_app/ui/lazy_loading_screen.dart';
import 'movie_app/movie/screens/home_screen.dart';


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
        LazyLoading.id: (_) => LazyLoading(),
        QuizScreen.id: (_) => QuizScreen(),
        MovieListView.id: (_) => MovieListView(),
        JsonPractice.id: (_) => JsonPractice(),
      },
    );
  }
}
