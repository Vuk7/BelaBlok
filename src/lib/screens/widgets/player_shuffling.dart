import 'package:bela_blok/themes/app_theme.dart';
import 'package:flutter/material.dart';

class PlayerShuffling extends StatelessWidget {
  final Function(int id) onTap;
  final int selected;
  final Color selectedColor;
  const PlayerShuffling(
      {super.key,
      required this.onTap,
      required this.selectedColor,
      this.selected = 0});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => onTap(2),
              child: Container(
                height: 30.0,
                width: 30.0,
                color: (selected == 2) ? selectedColor : AppTheme.gray,
                child: const Center(
                  child: Text(
                    "2",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 40,
            ),
            GestureDetector(
              onTap: () => onTap(3),
              child: Container(
                height: 30.0,
                width: 30.0,
                color: (selected == 3) ? selectedColor : AppTheme.gray,
                child: const Center(
                  child: Text(
                    "3",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
        const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: AppTheme.gray,
              )
            ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => onTap(1),
              child: Container(
                height: 30.0,
                width: 30.0,
                color: (selected == 1) ? selectedColor : AppTheme.gray,
                child: const Center(
                  child: Text(
                    "1",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 40,
            ),
            GestureDetector(
              onTap: () => onTap(4),
              child: Container(
                height: 30.0,
                width: 30.0,
                color: (selected == 4) ? selectedColor : AppTheme.gray,
                child: const Center(
                  child: Text(
                    "4",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
