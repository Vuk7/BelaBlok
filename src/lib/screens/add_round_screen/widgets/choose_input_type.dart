import 'package:flutter/material.dart';
import '../../../themes/app_theme.dart';

class ChooseInputType extends StatelessWidget {
  final int selectedChoice;
  final Color selectedColor;
  final Color notSelectedColor;
  final Function(int id) onTap;
  final double boxWidth;

  const ChooseInputType({
    super.key,
    required this.selectedChoice,
    required this.selectedColor,
    required this.notSelectedColor,
    required this.onTap,
    required this.boxWidth,
  });

  @override
  Widget build(BuildContext context) {
    final double minWidth = boxWidth > AppTheme.chooseInputTypeMinWidth ? boxWidth : AppTheme.chooseInputTypeMinWidth;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          constraints: BoxConstraints(minWidth: minWidth, maxWidth: AppTheme.chooseInputTypeMaxWidth),
          child: ChoiceChip(
            label: const Padding(
              padding: AppTheme.chooseInputTypeLabelPadding,
              child: Text(
                'Igra',
                style: AppTheme.chooseInputTypeLabelTextStyle,
              ),
            ),
            selected: selectedChoice == 0,
            onSelected: (v) {
              if (!v) return;
              onTap(0);
            },
            selectedColor: selectedColor,
            backgroundColor: notSelectedColor,
            labelStyle: AppTheme.chooseInputTypeChoiceChipTextStyle.copyWith(
              color: selectedChoice == 0 ? AppTheme.chooseInputTypeSelectedTextColor : AppTheme.chooseInputTypeNotSelectedTextColor,
            ),
          ),
        ),
       const SizedBox(width: AppTheme.chooseInputTypeSpacing),
        Container(
          constraints: BoxConstraints(minWidth: minWidth, maxWidth: AppTheme.chooseInputTypeMaxWidth),
          child: ChoiceChip(
            label: const Padding(
              padding: AppTheme.chooseInputTypeLabelPadding,
              child: Text(
                'Zvanje',
                style: AppTheme.chooseInputTypeLabelTextStyle,
              ),
            ),
            selected: selectedChoice == 1,
            onSelected: (v) {
              if (!v) return;
              onTap(1);
            },
            selectedColor: selectedColor,
            backgroundColor: notSelectedColor,
            labelStyle: AppTheme.chooseInputTypeChoiceChipTextStyle.copyWith(
              color: selectedChoice == 1 ? AppTheme.chooseInputTypeSelectedTextColor : AppTheme.chooseInputTypeNotSelectedTextColor,
            ),
          ),
        ),
      ],
    );
  }
}
