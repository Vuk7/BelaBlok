import 'package:flutter/material.dart';
import 'package:bela_blok/themes/app_theme.dart';
import 'stat_row_widget.dart';

class TeamColumnWidget extends StatelessWidget {
  final String label;
  final Color labelColor;
  final int calls;
  final int fails;
  final int declarations;
  final bool isDark;

  const TeamColumnWidget({
    super.key,
    required this.label,
    required this.labelColor,
    required this.calls,
    required this.fails,
    required this.declarations,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final statsColors = Theme.of(context).extension<GameStatsColors>();
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: labelColor,
          ),
        ),
        const SizedBox(height: 6),
        StatRowWidget(
          icon: Icons.phone_callback,
          label: 'Pozivi',
          value: calls.toString(),
          color: statsColors?.calls ?? Colors.blue,
          isDark: isDark,
        ),
        StatRowWidget(
          icon: Icons.trending_down,
          label: 'Padovi',
          value: fails.toString(),
          color: statsColors?.fails ?? Colors.red,
          isDark: isDark,
        ),
        StatRowWidget(
          icon: Icons.star,
          label: 'Zvanja',
          value: declarations.toString(),
          color: statsColors?.declarations ?? Colors.amber,
          isDark: isDark,
        ),
      ],
    );
  }
}
