import 'package:bela_blok/enums/play_direction_enum.dart';
import 'package:bela_blok/themes/app_theme.dart';
import 'package:flutter/material.dart';

class PlayerShuffling extends StatelessWidget {
  final Function(int id) onTap;
  final int selected;
  final Color selectedColor;
  final PlayDirection direction;

  const PlayerShuffling(
      {super.key,
      required this.onTap,
      required this.selectedColor,
      required this.selected,
      required this.direction});

  Widget _seat(BuildContext context, int player) {
    return GestureDetector(
      onTap: () => onTap(player),
      child: Container(
        height: 28.0,
        width: 28.0,
        decoration: BoxDecoration(
          color: (selected == player) ? selectedColor : AppTheme.gray,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.chair,
                  color: AppTheme.getInverseTextColor(context), size: 14),
              Text(
                "$player",
                style: TextStyle(
                    color: AppTheme.getInverseTextColor(context),
                    fontWeight: FontWeight.bold,
                    fontSize: 8),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool clockwise = direction == PlayDirection.clockwise;
    // Clockwise:        top-left=2, bottom-right=4
    // Counter-clockwise: top-left=4, bottom-right=2
    final int topLeft = clockwise ? 2 : 4;
    final int bottomRight = clockwise ?4 : 2;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _seat(context, topLeft),
            const SizedBox(width: 30),
            _seat(context, 3),
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
            _seat(context, 1),
            const SizedBox(width: 30),
            _seat(context, bottomRight),
          ],
        ),
      ],
    );
  }
}
