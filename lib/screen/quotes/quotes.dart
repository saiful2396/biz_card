import 'package:flutter/material.dart';

class Quotes extends StatefulWidget {
  static const String id = 'quotes';
  @override
  _QuotesState createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {
  int _index = 0;
  List<String> quotes = [
    '“The man who writes about himself and his own time is the only man who writes about all people and all time.”',
    '“It is a truth universally acknowledge that there will always be a gentleman to dance with, except at just the moment when you require one most.”',
    '“Life has never been All or Nothing- it\'s All and Nothing. Forget the binaries.”',
    '“It was truly an abomination of nature that one always found the most comfortable spot in the bed five minutes before one had to leave it.”'
  ];

  _getQuotes() {

    setState(() {
      _index++;
    });
    print(_index);
    // if(_index == quotes.length){
    //   setState(() {
    //     _index ++;
    //   });
    //
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quotes App'),
        centerTitle: true,
      ),
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  quotes[_index % quotes.length],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic, color: Colors.grey[600]),
                ),
              ),
            ),
          ),
          FlatButton.icon(
            color: Colors.lightBlue,
              onPressed: () => _getQuotes(),
              icon: Icon(Icons.wb_sunny),
              label: Padding(
                padding: EdgeInsets.only(top:8.0, bottom: 8.0),
                child: Text(
                  'Hit Me! to get Update',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
