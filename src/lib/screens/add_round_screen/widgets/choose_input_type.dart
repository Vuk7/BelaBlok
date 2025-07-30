import 'package:flutter/material.dart';

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
    final double minWidth = boxWidth > 90 ? boxWidth : 90;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          constraints: BoxConstraints(minWidth: minWidth, maxWidth: 140),
          child: ChoiceChip(
            label: const Padding(
              padding:  EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),
              child: Text(
                'Igra',
                style:  TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            selected: selectedChoice == 0,
            onSelected: (v) {
              if (!v) return;
              onTap(0);
            },
            selectedColor: selectedColor,
            backgroundColor: notSelectedColor,
            labelStyle: TextStyle(
              color: selectedChoice == 0 ? Colors.white : Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 14),
        Container(
          constraints: BoxConstraints(minWidth: minWidth, maxWidth: 140),
          child: ChoiceChip(
            label:const Padding(
              padding:  EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),
              child: Text(
                'Zvanje',
                style:  TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            selected: selectedChoice == 1,
            onSelected: (v) {
              if (!v) return;
              onTap(1);
            },
            selectedColor: selectedColor,
            backgroundColor: notSelectedColor,
            labelStyle: TextStyle(
              color: selectedChoice == 1 ? Colors.white : Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
