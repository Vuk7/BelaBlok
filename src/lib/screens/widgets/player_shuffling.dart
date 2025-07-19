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
      required this.selected});

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
                height: 28.0,
                width: 28.0,
                decoration: BoxDecoration(
                  color: (selected == 2) ? selectedColor : AppTheme.gray,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.chair,
                        color: AppTheme.getInverseTextColor(context),
                        size: 14,
                      ),
                      Text(
                        "2",
                        style: TextStyle(
                            color: AppTheme.getInverseTextColor(context),
                            fontWeight: FontWeight.bold,
                            fontSize: 8),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            GestureDetector(
              onTap: () => onTap(3),
              child: Container(
                height: 28.0,
                width: 28.0,
                decoration: BoxDecoration(
                  color: (selected == 3) ? selectedColor : AppTheme.gray,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.chair,
                        color: AppTheme.getInverseTextColor(context),
                        size: 14,
                      ),
                      Text(
                        "3",
                        style: TextStyle(
                            color: AppTheme.getInverseTextColor(context),
                            fontWeight: FontWeight.bold,
                            fontSize: 8),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  color: Colors.brown[600],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  Icons.table_restaurant,
                  color: AppTheme.getInverseTextColor(context),
                  size: 20,
                ),
              )
            ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => onTap(1),
              child: Container(
                height: 28.0,
                width: 28.0,
                decoration: BoxDecoration(
                  color: (selected == 1) ? selectedColor : AppTheme.gray,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.chair,
                        color: AppTheme.getInverseTextColor(context),
                        size: 14,
                      ),
                      Text(
                        "1",
                        style: TextStyle(
                            color: AppTheme.getInverseTextColor(context),
                            fontWeight: FontWeight.bold,
                            fontSize: 8),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            GestureDetector(
              onTap: () => onTap(4),
              child: Container(
                height: 28.0,
                width: 28.0,
                decoration: BoxDecoration(
                  color: (selected == 4) ? selectedColor : AppTheme.gray,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.chair,
                        color: AppTheme.getInverseTextColor(context),
                        size: 14,
                      ),
                      Text(
                        "4",
                        style: TextStyle(
                            color: AppTheme.getInverseTextColor(context),
                            fontWeight: FontWeight.bold,
                            fontSize: 8),
                      ),
                    ],
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
