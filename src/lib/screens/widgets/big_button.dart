import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final TextStyle textStyle;
  final Function() onTap;
  final double textPadding;
  const BigButton({
    super.key,
    required this.text,
    required this.textStyle,
    required this.bgColor,
    required this.onTap,
    this.textPadding = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: bgColor),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.all(textPadding),
          child: Center(
            child: Text(
              text,
              style: textStyle,
            ),
          ),
        ),
      ),
    );
  }
}
