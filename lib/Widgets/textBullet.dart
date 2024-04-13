import 'package:flutter/cupertino.dart';
import 'package:untitled3/Const/color.dart';

  Widget TextBullet(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('•  ', style: TextStyle(fontSize: 20, height: 1.2,color: color)),
        Expanded(
            child: Text(text, style: TextStyle(fontSize: 16, height: 1.2))),
      ],
    );
  }
