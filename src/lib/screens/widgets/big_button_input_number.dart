import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MaxValueInputFormatter extends TextInputFormatter {
  final int maxValue;

  MaxValueInputFormatter(this.maxValue);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final int? value = int.tryParse(newValue.text);
    if (value == null) {
      return oldValue;
    }

    if (value > maxValue) {
      return TextEditingValue(
        text: maxValue.toString(),
        selection: TextSelection.collapsed(offset: maxValue.toString().length),
      );
    }

    return newValue;
  }
}

class BigButtonInputNumber extends StatelessWidget {
  final String text;
  final Color bgColor;
  final TextStyle textStyle;
  final Function() onTap;
  final TextEditingController inputController;
  final double textPadding;
  final double? width;
  final String? suffixText;
  final int maxValue;

  const BigButtonInputNumber({
    super.key,
    required this.text,
    required this.textStyle,
    required this.bgColor,
    required this.onTap,
    required this.inputController,
    this.textPadding = 20.0,
    this.width,
    this.suffixText,
    this.maxValue = 252,
  });

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
            hintStyle: textStyle,
            suffixText: suffixText,
            suffixStyle: textStyle.copyWith(fontSize: 15, color: Colors.grey[700]),
          ),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
            MaxValueInputFormatter(maxValue),
          ],
        ),
      ),
    );
  }
}
