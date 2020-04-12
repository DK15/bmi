

import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.clr, @required this.childCard});

  final Color clr;
  final Widget childCard;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: clr,
            borderRadius: BorderRadius.circular(10)
        ),
        child: childCard
    );
  }
}