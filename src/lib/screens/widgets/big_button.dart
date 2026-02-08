import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final TextStyle textStyle;
  final Function() onTap;
  final double textPadding;
  final IconData? icon;
  final double? width;
  final double? height;
  const BigButton({
    super.key,
    required this.text,
    required this.textStyle,
    required this.bgColor,
    required this.onTap,
    this.textPadding = 20.0,
    this.icon,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: bgColor),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.all(textPadding),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: textStyle,
                ),
                if (icon != null) ...[
                  const SizedBox(width: 8),
                  Icon(
                    icon,
                    color: textStyle.color,
                    size: textStyle.fontSize,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
