import 'package:bela_blok/enums/team_enum.dart';
import 'package:bela_blok/themes/app_theme.dart';
import 'package:flutter/material.dart';

class ShowLostText extends StatelessWidget {
  final bool show;
  final Team teamLost;
  const ShowLostText({
    super.key,
    required this.show,
    required this.teamLost,
  });

  @override
  Widget build(BuildContext context) {
    return (show)
        ? Row(children: [
            const Spacer(),
            (teamLost == Team.teamOne)
                ? Container(
                    padding: AppTheme.showLostTextContainerPadding,
                    decoration: BoxDecoration(
                      color: AppTheme.showLostTextBackgroundColor,
                      borderRadius: BorderRadius.circular(AppTheme.showLostTextBorderRadius),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.trending_down,
                          color: AppTheme.showLostTextIconColor,
                          size: AppTheme.showLostTextIconSize,
                        ),
                        SizedBox(width: AppTheme.showLostTextIconSpacing),
                        Text(
                          "PAD",
                          style: AppTheme.showLostTextStyle,
                        ),
                      ],
                    ),
                  )
                : const SizedBox(width: AppTheme.showLostTextContainerWidth),
            const Spacer(),
           const SizedBox(width: AppTheme.showLostTextHorizontalSpacing),
            const Spacer(),
            (teamLost == Team.teamTwo)
                ? Container(
                    padding: AppTheme.showLostTextContainerPadding,
                    decoration: BoxDecoration(
                      color: AppTheme.showLostTextBackgroundColor,
                      borderRadius: BorderRadius.circular(AppTheme.showLostTextBorderRadius),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.trending_down,
                          color: AppTheme.showLostTextIconColor,
                          size: AppTheme.showLostTextIconSize,
                        ),
                        SizedBox(width: AppTheme.showLostTextIconSpacing),
                        Text(
                          "PAD",
                          style: AppTheme.showLostTextStyle,
                        ),
                      ],
                    ),
                  )
                : const SizedBox(width: AppTheme.showLostTextContainerWidth),
            const Spacer(),
          ])
        : const SizedBox(height: AppTheme.showLostTextContainerHeight);
  }
}
