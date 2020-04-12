import 'package:bmi/reusable_card.dart';
import 'package:flutter/material.dart';

import 'input_page.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({@required this.bmiResult,@required this.resultText,@required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                'Your Result', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold), textAlign: TextAlign.center,
              )
            )
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              clr: Color(0xFF1D1E33),
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(resultText.toUpperCase(), style: TextStyle(color: Color(0xFF24D876)),),
                  Text(bmiResult, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),),
                  Text(interpretation, style: TextStyle(fontSize: 22), textAlign: TextAlign.center,),

                ],
              ),
            )
          ),
          GestureDetector(
            child: Container(
                color: bottomContainerColor,
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: bottomContainerHeight.roundToDouble(),
                child: Center(
                  //  padding: EdgeInsets.only(top: 15),
                    child: Text('RE-CALCULATE', style: TextStyle(fontSize: 20),textAlign: TextAlign.center,)
                )
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => InputPage()));
            },
          )
        ],
      )
    );
  }
}