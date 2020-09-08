import 'package:flutter/material.dart';

class Calculate extends StatefulWidget {
  static const id = 'calculator_screen';
  @override
  _CalculateState createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {

  double _billAmount = 0.0;
  int _tipPercent = 0;
  int _personCounter = 1;

  calculateTotalAmount(billAmount, splitBy, tipPercentage) {
    var totalPerPerson = (calculateTotalTips(billAmount, splitBy, tipPercentage) + billAmount) / splitBy;
    return totalPerPerson.toStringAsFixed(2);
  }

   calculateTotalTips(billAmount, splitBy, tipPercentage) {
     double totalTip = 0.0;
     if (billAmount < 0 || billAmount.toString().isEmpty || billAmount == null) {
       print('Enter your valid amount');
     } else {
       totalTip = (billAmount * tipPercentage) / 100;
     }
     return totalTip;
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Bill Calculator'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
        child: ListView(
          children: [
            Container(
              height: 150,
              width: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 12.0),
                    child: Text(
                      'Total Bill PerPerson',
                      style: TextStyle(color: Colors.teal, fontSize: 20),
                    ),
                  ),
                  Text(
                    '\$ ${calculateTotalAmount(_billAmount, _personCounter, _tipPercent)}',
                    style: TextStyle(fontSize: 25, color: Colors.teal),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 15.0),
              padding: EdgeInsets.all(12.0),
              child: Column(
                children: [
                  TextFormField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    onChanged: (String value) {
                      try {
                        _billAmount = double.parse(value);
                      } catch (e) {
                        print(e);
                        _billAmount = 0.0;
                      }
                    },
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    decoration: InputDecoration(
                        prefixText: 'Bill Amount ',
                        prefixStyle:
                            TextStyle(fontSize: 18, color: Colors.grey[700])),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Split',
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[700])),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              if (_personCounter > 1) {
                                setState(() {
                                  _personCounter--;
                                });
                              }
                            },
                            child: Container(
                              height: 40.0,
                              width: 40.0,
                              margin: EdgeInsets.all(10.0),
                              child: Icon(Icons.remove, color: Colors.teal),
                            ),
                          ),
                          Text(
                            '$_personCounter',
                            style: TextStyle(color: Colors.teal, fontSize: 18),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _personCounter++;
                              });
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              margin: EdgeInsets.all(10.0),
                              child: Icon(Icons.add, color: Colors.teal),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tip',
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[700])),
                      Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Text(
                          '\$ ${(calculateTotalTips(_billAmount,
                              _personCounter, _tipPercent).toStringAsFixed(2))}',
                          style: TextStyle(color: Colors.teal, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '$_tipPercent%',
                        style: TextStyle(color: Colors.teal, fontSize: 18.0),
                      ),
                      Slider(
                        min: 0,
                        max: 100,
                        divisions: 10,
                        activeColor: Colors.teal,
                        inactiveColor: Colors.grey[500],
                        value: _tipPercent.toDouble(),
                        onChanged: (double value) {
                          setState(() {
                            _tipPercent = value.round();
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
