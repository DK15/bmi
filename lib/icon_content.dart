

import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {

  final IconData iconData;
  final String label;

  const IconContent({Key key, this.iconData, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(iconData, size: 80,),
        Padding(
            padding: EdgeInsets.only(top: 15),
            child: Text(label, style: TextStyle(color: Colors.grey),)
        )
      ],
    );
  }
}