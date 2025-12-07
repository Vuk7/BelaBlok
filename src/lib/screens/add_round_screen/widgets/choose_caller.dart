import 'package:flutter/material.dart';

class ChooseCaller extends StatelessWidget {
  final int selectedChoice;
  final Color selectedColor;
  final Color notSelectedColor;
  final Function(int id) onTap;

  const ChooseCaller(
      {super.key,
      required this.selectedChoice,
      required this.selectedColor,
      required this.notSelectedColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        InkWell(
            onTap: () => onTap(0),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: (selectedChoice == 0)
                        ? selectedColor
                        : notSelectedColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "MI",
                    style: TextStyle(
                        color: (selectedChoice == 0)
                            ? selectedColor
                            : notSelectedColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )),
        const Spacer(),
        const SizedBox(
          width: 20,
        ),
        const Spacer(),
        InkWell(
            onTap: () => onTap(1),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: (selectedChoice == 1)
                        ? selectedColor
                        : notSelectedColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "VI",
                    style: TextStyle(
                        color: (selectedChoice == 1)
                            ? selectedColor
                            : notSelectedColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )),
        const Spacer(),
      ],
    );
  }
}
