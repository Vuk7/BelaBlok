import 'package:bela_blok/screens/new_game_screen/widgets/animated_play_direction_choice.dart';
import 'package:bela_blok/themes/app_theme.dart';
import 'package:flutter/material.dart';

class GameSettingsMenu extends StatefulWidget {
  final int playDirectionSelect;
  final Function(int) onPlayDirectionChanged;

  const GameSettingsMenu({
    super.key,
    required this.playDirectionSelect,
    required this.onPlayDirectionChanged,
  });

  @override
  State<GameSettingsMenu> createState() => _GameSettingsMenuState();
}

class _GameSettingsMenuState extends State<GameSettingsMenu> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppTheme.gameSettingsMenuMargin,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark 
          ? Colors.grey[800] 
          : Colors.white,
        borderRadius: BorderRadius.circular(AppTheme.gameSettingsMenuBorderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: AppTheme.gameSettingsMenuShadowOpacity),
            blurRadius: AppTheme.gameSettingsMenuShadowBlurRadius,
            offset: AppTheme.gameSettingsMenuShadowOffset,
          ),
        ],
      ),
      child: Column(
        children: [
          // Header s ikonom kotačića
          InkWell(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            borderRadius: BorderRadius.circular(AppTheme.gameSettingsMenuBorderRadius),
            child: Padding(
              padding: AppTheme.gameSettingsMenuHeaderPadding,
              child: Row(
                children: [
                  const Icon(
                    Icons.rotate_right,
                    color: AppTheme.green,
                    size: AppTheme.gameSettingsMenuIconSize,
                  ),
                  const SizedBox(width: AppTheme.gameSettingsMenuIconSpacing),
                  Expanded(
                    child: Text(
                      "POSTAVKE SMJERA",
                      style: AppTheme.gameSettingsMenuHeaderTextStyle.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                  Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: Theme.of(context).colorScheme.onSurface,
                    size: AppTheme.gameSettingsMenuIconSize,
                  ),
                ],
              ),
            ),
          ),
          // Expandable sadržaj
          AnimatedContainer(
            duration: AppTheme.gameSettingsMenuAnimationDuration,
            curve: AppTheme.gameSettingsMenuAnimationCurve,
            height: isExpanded ? null : 0,
            child: isExpanded
                ? Padding(
                    padding: AppTheme.gameSettingsMenuContentPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Divider(),
                        const SizedBox(height: AppTheme.gameSettingsMenuSectionSpacing),
                        // Smjer sekcija
                        Text(
                          "SMJER",
                          style: AppTheme.gameSettingsMenuSectionTextStyle.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: AppTheme.gameSettingsMenuItemSpacing),
                        AnimatedPlayDirectionChoice(
                          selectedChoice: widget.playDirectionSelect,
                          selectedColor: AppTheme.green,
                          notSelectedColor: Theme.of(context).colorScheme.onSurface,
                          onTap: widget.onPlayDirectionChanged,
                        ),
                        const SizedBox(height: AppTheme.gameSettingsMenuBottomSpacing),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
