import 'package:flutter/material.dart';

import 'constants.dart';

class BottomActionButton extends StatelessWidget {
  final String btnTitle;
  final Function onTapBelowButton;

  BottomActionButton({@required this.btnTitle, this.onTapBelowButton});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapBelowButton,
      child: Container(
        padding: EdgeInsets.only(bottom: 15.0),
        child: Center(
          child: Text(
            btnTitle,
            style: kCalculateStyle,
          ),
        ),
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: kBottonContainerColor,
          borderRadius: BorderRadius.circular(20),
        ),
        height: kBottomContainerHeight,
        width: double.infinity,
      ),
    );
  }
}
