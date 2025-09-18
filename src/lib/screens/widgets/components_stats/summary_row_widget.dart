import 'package:flutter/material.dart';
import 'package:bela_blok/themes/app_theme.dart';
import 'mini_stat_widget.dart';

class SummaryRowWidget extends StatelessWidget {
  final int success1;
  final int success2;
  final bool isDark;

  const SummaryRowWidget({
    super.key,
    required this.success1,
    required this.success2,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final statsColors = Theme.of(context).extension<GameStatsColors>();
    
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: statsColors?.successCard ?? (isDark ? Colors.grey[700] : Colors.grey[100]),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: MiniStatWidget(
              label: 'Uspješnost MI',
              value: '$success1%',
              isDark: isDark,
            ),
          ),
          Container(
            width: 1,
            height: 28,
            color: statsColors?.divider ?? 
                Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.15),
            margin: const EdgeInsets.symmetric(horizontal: 12),
          ),
          Expanded(
            child: MiniStatWidget(
              label: 'Uspješnost VI',
              value: '$success2%',
              isDark: isDark,
            ),
          ),
        ],
      ),
    );
  }
}
