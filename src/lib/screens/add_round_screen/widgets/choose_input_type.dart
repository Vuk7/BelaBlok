import 'package:bela_blok/screens/widgets/big_button.dart';
import 'package:flutter/material.dart';

class ChooseInputType extends StatelessWidget {
  final int selectedChoice;
  final Color selectedColor;
  final Color notSelectedColor;
  final Function(int id) onTap;
  final double boxWidth;
  const ChooseInputType(
      {super.key,
      required this.selectedChoice,
      required this.selectedColor,
      required this.notSelectedColor,
      required this.onTap,
      required this.boxWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        BigButton(
          text: "IGRA",
          textStyle: TextStyle(
              color: (selectedChoice == 0) ? Colors.white : Colors.black, 
              fontSize: 24, 
              fontWeight: FontWeight.bold),
          bgColor: (selectedChoice == 0) ? const Color(0xFF4CAF50) : notSelectedColor, // Zelena boja
          onTap: () => onTap(0),
          textPadding: 4,
          width: boxWidth,
        ),
        BigButton(
          text: "ZVANJE",
          textStyle: TextStyle(
              color: (selectedChoice == 1) ? Colors.white : Colors.black, 
              fontSize: 24, 
              fontWeight: FontWeight.bold),
          bgColor: (selectedChoice == 1) ? Colors.red : notSelectedColor,
          onTap: () => onTap(1),
          textPadding: 4,
          width: boxWidth,
        ),
      ],
    );
  }
}
