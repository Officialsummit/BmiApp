import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {
  final Color colors;
  final Widget containerChild;
  final Function onPress;
  ReusableContainer({@required this.colors, this.containerChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: containerChild,
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: this.colors,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
