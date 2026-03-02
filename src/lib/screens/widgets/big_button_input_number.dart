import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/constants.dart';

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
  final bool baseGameOnly;

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
    this.maxValue = maxManualScoreInput,
    this.baseGameOnly = false,
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
            _MaxValueInputFormatter(maxValue, baseGameOnly: baseGameOnly),
          ],
        ),
      ),
    );
  }
}

class _MaxValueInputFormatter extends TextInputFormatter {
  final int maxValue;
  final bool baseGameOnly;

  _MaxValueInputFormatter(this.maxValue, {this.baseGameOnly = false});

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
      return oldValue;
    }

    // In base game mode, only 0-162 and 252 are valid
    if (baseGameOnly && value > maxScore && value != maxManualScoreInput) {
      return oldValue;
    }

    return newValue;
  }
}
