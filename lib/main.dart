import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BizCard(),
    );
  }
}
class BizCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biz Card'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                _getCard(),
                //_getAvatar(),
                CircleAvatar(
                  backgroundImage:
                  NetworkImage('https://picsum.photos/seed/picsum/200/300'),
                  radius: 50.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _getCard() {
    return Container(
      height: 220,
      width: 320,
      margin: EdgeInsets.only(bottom:50.0, top: 50),
      decoration: BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Learning BizCard Design',style: TextStyle(color: Colors.white, fontSize: 16),),
          Text('Flutter Developer'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person_outline),
              Text('T: @developWithMe'),
            ],
          ),
        ],
      ),
    );
  }

  /*Container _getAvatar() {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: NetworkImage('https://picsum.photos/seed/picsum/300/300'),
          fit: BoxFit.cover,
        ),
        border: Border.all(width: 1.2, color: Colors.redAccent),
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
      ),
    );
  }*/
}
