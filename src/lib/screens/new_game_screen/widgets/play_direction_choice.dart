import 'package:flutter/material.dart';
import 'package:bela_blok/themes/app_theme.dart';

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
                Container(
                  width: AppTheme.playDirectionIconContainerSize,
                  height: AppTheme.playDirectionIconContainerSize,
                  decoration: BoxDecoration(
                    color: (selectedChoice == 0) ? selectedColor : notSelectedColor,
                    borderRadius: BorderRadius.circular(AppTheme.playDirectionBorderRadius),
                  ),
                  child: const Icon(
                    Icons.rotate_right,
                    color: AppTheme.playDirectionIconColor,
                    size: AppTheme.playDirectionIconSize,
                  ),
                ),
                const SizedBox(
                  width: AppTheme.playDirectionSpacingHorizontal,
                ),
                Text(
                  "U SMJERU KAZALJKE NA SATU",
                  style: AppTheme.playDirectionLabelTextStyle.copyWith(
                    color: (selectedChoice == 0) ? selectedColor : notSelectedColor,
                  ),
                )
              ],
            )),
        const SizedBox(
          height: AppTheme.playDirectionSpacingVertical,
        ),
        GestureDetector(
            onTap: () => onTap(1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: AppTheme.playDirectionIconContainerSize,
                  height: AppTheme.playDirectionIconContainerSize,
                  decoration: BoxDecoration(
                    color: (selectedChoice == 1) ? selectedColor : notSelectedColor,
                    borderRadius: BorderRadius.circular(AppTheme.playDirectionBorderRadius),
                  ),
                  child: const Icon(
                    Icons.rotate_left,
                    color: AppTheme.playDirectionIconColor,
                    size: AppTheme.playDirectionIconSize,
                  ),
                ),
                const SizedBox(
                  width: AppTheme.playDirectionSpacingHorizontal,
                ),
                Text(
                  "SUPROTNO OD KAZALJKE NA SATU",
                  style: AppTheme.playDirectionLabelTextStyle.copyWith(
                    color: (selectedChoice == 1) ? selectedColor : notSelectedColor,
                  ),
                )
              ],
            )),
      ],
    );
  }
}
