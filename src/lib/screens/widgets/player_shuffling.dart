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
                height: AppTheme.playerShufflingChairContainerSize,
                width: AppTheme.playerShufflingChairContainerSize,
                decoration: BoxDecoration(
                  color: (selected == 2) ? selectedColor : AppTheme.gray,
                  borderRadius: BorderRadius.circular(AppTheme.playerShufflingChairBorderRadius),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.chair,
                        color: AppTheme.getInverseTextColor(context),
                        size: AppTheme.playerShufflingChairIconSize,
                      ),
                      Text(
                        "2",
                        style: AppTheme.playerShufflingChairTextStyle.copyWith(
                            color: AppTheme.getInverseTextColor(context)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
           const SizedBox(
              width: AppTheme.playerShufflingChairSpacing,
            ),
            GestureDetector(
              onTap: () => onTap(3),
              child: Container(
                height: AppTheme.playerShufflingChairContainerSize,
                width: AppTheme.playerShufflingChairContainerSize,
                decoration: BoxDecoration(
                  color: (selected == 3) ? selectedColor : AppTheme.gray,
                  borderRadius: BorderRadius.circular(AppTheme.playerShufflingChairBorderRadius),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.chair,
                        color: AppTheme.getInverseTextColor(context),
                        size: AppTheme.playerShufflingChairIconSize,
                      ),
                      Text(
                        "3",
                        style: AppTheme.playerShufflingChairTextStyle.copyWith(
                            color: AppTheme.getInverseTextColor(context)),
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
                height: AppTheme.playerShufflingTableContainerSize,
                width: AppTheme.playerShufflingTableContainerSize,
                decoration: BoxDecoration(
                  color: AppTheme.playerShufflingTableColor,
                  borderRadius: BorderRadius.circular(AppTheme.playerShufflingTableBorderRadius),
                ),
                child: Icon(
                  Icons.table_restaurant,
                  color: AppTheme.getInverseTextColor(context),
                  size: AppTheme.playerShufflingTableIconSize,
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
                height: AppTheme.playerShufflingChairContainerSize,
                width: AppTheme.playerShufflingChairContainerSize,
                decoration: BoxDecoration(
                  color: (selected == 1) ? selectedColor : AppTheme.gray,
                  borderRadius: BorderRadius.circular(AppTheme.playerShufflingChairBorderRadius),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.chair,
                        color: AppTheme.getInverseTextColor(context),
                        size: AppTheme.playerShufflingChairIconSize,
                      ),
                      Text(
                        "1",
                        style: AppTheme.playerShufflingChairTextStyle.copyWith(
                            color: AppTheme.getInverseTextColor(context)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
           const SizedBox(
              width: AppTheme.playerShufflingChairSpacing,
            ),
            GestureDetector(
              onTap: () => onTap(4),
              child: Container(
                height: AppTheme.playerShufflingChairContainerSize,
                width: AppTheme.playerShufflingChairContainerSize,
                decoration: BoxDecoration(
                  color: (selected == 4) ? selectedColor : AppTheme.gray,
                  borderRadius: BorderRadius.circular(AppTheme.playerShufflingChairBorderRadius),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.chair,
                        color: AppTheme.getInverseTextColor(context),
                        size: AppTheme.playerShufflingChairIconSize,
                      ),
                      Text(
                        "4",
                        style: AppTheme.playerShufflingChairTextStyle.copyWith(
                            color: AppTheme.getInverseTextColor(context)),
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
