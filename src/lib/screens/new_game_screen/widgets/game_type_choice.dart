import 'package:bela_blok/screens/widgets/big_button.dart';
import 'package:bela_blok/screens/widgets/big_button_input_number.dart';
import 'package:bela_blok/themes/app_theme.dart';
import 'package:flutter/material.dart';

class GameTypeChoice extends StatelessWidget {
  final TextEditingController inputGameTypeController;
  final int selectedChoice;
  final Color selectedColor;
  final Color notSelectedColor;
  final Function(int id) onTap;
  const GameTypeChoice(
      {super.key,
      required this.inputGameTypeController,
      required this.selectedChoice,
      required this.selectedColor,
      required this.notSelectedColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: AppTheme.gameTypeButtonPadding,
          child: BigButton(
            text: "1001",
            textStyle: AppTheme.gameTypeNumberButtonTextStyle,
            bgColor: (selectedChoice == 0) ? selectedColor : notSelectedColor,
            onTap: () => onTap(0),
            textPadding: AppTheme.gameTypeButtonTextPadding,
          ),
        ),
        Padding(
          padding: AppTheme.gameTypeButtonPaddingNoTop,
          child: BigButton(
            text: "501",
            textStyle: AppTheme.gameTypeNumberButtonTextStyle,
            bgColor: (selectedChoice == 1) ? selectedColor : notSelectedColor,
            onTap: () => onTap(1),
            textPadding: AppTheme.gameTypeButtonTextPadding,
          ),
        ),
        Padding(
          padding: AppTheme.gameTypeButtonPaddingNoTop,
          child: BigButtonInputNumber(
            text: "RUČNO",
            textStyle: AppTheme.gameTypeManualButtonTextStyle,
            bgColor: (selectedChoice == 2) ? selectedColor : notSelectedColor,
            onTap: () => onTap(2),
            inputController: inputGameTypeController,
            textPadding: AppTheme.gameTypeButtonTextPadding,
          ),
        ),
      ],
    );
  }
}
