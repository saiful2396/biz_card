import 'package:biz_card/models/questions.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  static const id = 'quiz_screen';
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  var _questionNumber = 0;
  List<Questions> questionBank = [
    Questions('বাংলাদেশের জাতীয় পতাকার রঙ লাল এবং সবুজ', true),
    Questions('বাংলাদেশের পতাকার কয়টি রং তিনটি', false),
    Questions('বাংলাদেশের জাতীয় পতাকার ডিজাইনার কামরুল হাসান', true),
    Questions('বাংলাদেশের জাতীয় পতাকার অনুপাত  ১০ : ৬ বা ৫ : ৩', true),
    Questions('জাতীয় পতাকার লাল বৃত্তের মাপ পতাকার ৫ ভাগের ২ অংশ', false),
    Questions('বাংলাদেশের পতাকা প্রথম উত্তোলন করা হয় ২ মার্চ ১৯৭২ সালে', false),
    Questions('বাংলাদেশের পতাকা দিবস ২ মার্চ', true),
    Questions('বাংলাদেশের পতাকার সাথে মিল রয়েছে ভারতের পতাকার', false),
    Questions('বাংলাদেশের ক্রিড়া সংগীতের রচয়িতা সেলিমা রহমান', true),
    Questions('ক্রীড়া সঙ্গীতের সুরকার সেলিমা রহমান', false),
    Questions('বাংলাদেশের মানচিত্র প্রথম আঁকেন মেজর জেমস রেনেল', true),
    Questions(
        'মানচিত্র খচিত বাংলাদেশের প্রথম জাতীয় পতাকার ডিজাইনার ছিলেন শিব নারায়ণ দাশ',
        true),
  ];

  _getAnswer(bool userChoice, BuildContext context) {
    if (userChoice == questionBank[_questionNumber].questionAnswer) {
      final snackBar = SnackBar(
        backgroundColor: Color(0xFF006352),
        duration: Duration(milliseconds: 500),
        content: Text(
          'Correct',
          textAlign: TextAlign.center,
        ),
      );
      Scaffold.of(context).showSnackBar(snackBar);
      _updateQuestion();
    } else {
      final snackBar = SnackBar(
        backgroundColor: Color(0xFFBD2129),
        duration: Duration(milliseconds: 500),
        content: Text(
          'Correct',
          textAlign: TextAlign.center,
        ),
      );
      Scaffold.of(context).showSnackBar(snackBar);
      _updateQuestion();
    }
  }

  _updateQuestion() {
    setState(() {
      _questionNumber = (_questionNumber + 1) % questionBank.length;
    });
  }
  _previousQuestion() {
    setState(() {
      _questionNumber = (_questionNumber - 1) % questionBank.length;
    });
  }
  _nextQuestion() {
    _updateQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF221F1F),
      appBar: AppBar(
        title: Text('সত্য নাগরিক'),
        centerTitle: true,
        backgroundColor: Color(0xFF006B52),
      ),
      body: Builder(builder: (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(10.0),
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/flag.gif'), fit: BoxFit.cover),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(20.0),
                padding: EdgeInsets.all(20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFF006B52),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Text(
                  questionBank[_questionNumber].questionText,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: RaisedButton(
                      onPressed: () => _previousQuestion(),
                      color: Color(0xFF006B52),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                      onPressed: () => _getAnswer(true, context),
                      color: Color(0xFF006B52),
                      child: Text(
                        'সত্য',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                      onPressed: () => _getAnswer(false, context),
                      color: Color(0xFF006B52),
                      child: Text(
                        'মিথ্যা',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                      onPressed: () => _nextQuestion(),
                      color: Color(0xFF006B52),
                      child: Center(
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
          ],
        );
      }),
    );
  }
}
