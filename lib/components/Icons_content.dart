import 'package:flutter/material.dart';
import 'constants.dart';

class ColumnWidget extends StatelessWidget {
  final IconData childIcon;

  final String childText;

  ColumnWidget({this.childIcon, this.childText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          childIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          childText,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
