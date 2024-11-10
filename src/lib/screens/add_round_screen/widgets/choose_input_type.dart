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
          textStyle: const TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          bgColor: (selectedChoice == 0) ? selectedColor : notSelectedColor,
          onTap: () => onTap(0),
          textPadding: 4,
          width: boxWidth,
        ),
        BigButton(
          text: "ZVANJE",
          textStyle: const TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          bgColor: (selectedChoice == 1) ? selectedColor : notSelectedColor,
          onTap: () => onTap(1),
          textPadding: 4,
          width: boxWidth,
        ),
      ],
    );
  }
}
