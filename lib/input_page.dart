import 'package:bmi/icon_content.dart';
import 'package:bmi/result_screen.dart';
import 'package:bmi/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bmi_calculator.dart';

const bottomContainerHeight = 60;
const activeContainerColor = Color(0xFF1D1E33);
const inactiveContainerColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);
int height = 180;
int weight = 60;
int age = 18;

enum Gender {
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleContainerColor = inactiveContainerColor;
  Color femaleContainerColor = inactiveContainerColor;

  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableCard(clr: selectedGender == Gender.male ? activeContainerColor : inactiveContainerColor,
                      childCard: IconContent(iconData: FontAwesomeIcons.mars, label: 'MALE',)),
                  )
                ),
                Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      child: ReusableCard(clr: selectedGender == Gender.female ? activeContainerColor : inactiveContainerColor,
                        childCard: IconContent(iconData: FontAwesomeIcons.venus, label: 'FEMALE')
                      ),
                    )
                ),
              ],
            )
          ),
          Expanded(
              child: ReusableCard(
                  clr: activeContainerColor,
                  childCard: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Text('HEIGHT', style: TextStyle(color: Colors.grey)
                      )
                      ),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(height.toString(), style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900),),
                        Text('cm')
                      ],
                      ),
                      Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        activeColor: Color(0xFFEB1555),
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newVal){
                          setState(() {
                            height = newVal.round();
                          });
                        },
                      )
                    ],
                  ),
              )
          ),
          Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ReusableCard(clr: activeContainerColor,
                        childCard: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Text('WEIGHT', style: TextStyle(color: Colors.grey),)
                            ),
                            Text(weight.toString(), style: TextStyle(fontWeight: FontWeight.w900, fontSize: 50),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                IconButton(icon: Icon(Icons.add_circle, color: Colors.grey,),
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                ),

                                IconButton(icon: Icon(Icons.remove_circle, color: Colors.grey,),
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                )
                              ],
                            )

                          ],
                        ),
                      )
                  ),
                  Expanded(
                      child: ReusableCard(clr: activeContainerColor,
                      childCard: Column(
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Text('AGE', style: TextStyle(color: Colors.grey),)
                          ),
                          Text(age.toString(), style: TextStyle(fontWeight: FontWeight.w900, fontSize: 50),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              IconButton(icon: Icon(Icons.add_circle, color: Colors.grey,),
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),

                              IconButton(icon: Icon(Icons.remove_circle, color: Colors.grey,),
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                      )
                  ),
                ],
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
                    child: Text('CALCULATE', style: TextStyle(fontSize: 20),textAlign: TextAlign.center,)
                )
            ),
            onTap: () {
              BMICalculator bmiRes = BMICalculator(weight: weight, height: height);
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultScreen(bmiResult: bmiRes.calculateBMI(), resultText: bmiRes.getResult(), interpretation: bmiRes.getFeedback(),)));
            },
          )

        ],
      )
    );
  }
}





