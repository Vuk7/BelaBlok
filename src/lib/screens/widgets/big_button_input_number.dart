import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BigButtonInputNumber extends StatelessWidget {
  final String text;
  final Color bgColor;
  final TextStyle textStyle;
  final Function() onTap;
  final TextEditingController inputController;
  final double textPadding;
  final double? width;
  const BigButtonInputNumber(
      {super.key,
      required this.text,
      required this.textStyle,
      required this.bgColor,
      required this.onTap,
      required this.inputController,
      this.textPadding = 20.0,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(color: bgColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(textPadding),
        child: TextField(
          controller: inputController,
          textAlign: TextAlign.center,
          style: textStyle,
          onTap: onTap,
          decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: text,
              hintStyle: textStyle),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
        ),
      ),
    );
  }
}
