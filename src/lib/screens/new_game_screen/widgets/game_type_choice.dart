import 'package:bela_blok/screens/widgets/big_button.dart';
import 'package:bela_blok/screens/widgets/big_button_input_number.dart';
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
          padding:
              const EdgeInsets.only(right: 90, left: 90, top: 10, bottom: 10),
          child: BigButton(
            text: "1001",
            textStyle: const TextStyle(
                color: Colors.black, fontSize: 36, fontWeight: FontWeight.bold),
            bgColor: (selectedChoice == 0) ? selectedColor : notSelectedColor,
            onTap: () => onTap(0),
            textPadding: 10,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 90, left: 90, bottom: 10),
          child: BigButton(
            text: "501",
            textStyle: const TextStyle(
                color: Colors.black, fontSize: 36, fontWeight: FontWeight.bold),
            bgColor: (selectedChoice == 1) ? selectedColor : notSelectedColor,
            onTap: () => onTap(1),
            textPadding: 10,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 90, left: 90, bottom: 10),
          child: BigButtonInputNumber(
            text: "RUČNO",
            textStyle: const TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
            bgColor: (selectedChoice == 2) ? selectedColor : notSelectedColor,
            onTap: () => onTap(2),
            inputController: inputGameTypeController,
            textPadding: 10,
          ),
        ),
      ],
    );
  }
}
