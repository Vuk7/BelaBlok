import 'package:bela_blok/screens/new_game_screen/widgets/play_direction_choice.dart';
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
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark 
          ? Colors.grey[800] 
          : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
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
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(
                    Icons.rotate_right,
                    color: AppTheme.green,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "POSTAVKE SMJERA",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                  ),
                  Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: Theme.of(context).colorScheme.onBackground,
                    size: 28,
                  ),
                ],
              ),
            ),
          ),
          // Expandable sadržaj
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: isExpanded ? null : 0,
            child: isExpanded
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Divider(),
                        const SizedBox(height: 16),
                        // Smjer sekcija
                        Text(
                          "SMJER",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                        const SizedBox(height: 12),
                        PlayDirectionChoice(
                          selectedChoice: widget.playDirectionSelect,
                          selectedColor: AppTheme.green,
                          notSelectedColor: Theme.of(context).colorScheme.onBackground,
                          onTap: widget.onPlayDirectionChanged,
                        ),
                        const SizedBox(height: 8),
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
