import 'package:flutter/material.dart';

class PlayDirectionChoice extends StatelessWidget {
  final int selectedChoice;
  final Color selectedColor;
  final Color notSelectedColor;
  final Function(int id) onTap;
  const PlayDirectionChoice({
    super.key,
    required this.selectedChoice,
    required this.selectedColor,
    required this.notSelectedColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            onTap: () => onTap(0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor:
                      (selectedChoice == 0) ? selectedColor : notSelectedColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "U SMJERU KAZALJKE NA SATU",
                  style: TextStyle(
                      color: (selectedChoice == 0)
                          ? selectedColor
                          : notSelectedColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )
              ],
            )),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
            onTap: () => onTap(1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor:
                      (selectedChoice == 1) ? selectedColor : notSelectedColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "SUPROTNO OD KAZALJKE NA SATU",
                  style: TextStyle(
                      color: (selectedChoice == 1)
                          ? selectedColor
                          : notSelectedColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )
              ],
            )),
      ],
    );
  }
}
