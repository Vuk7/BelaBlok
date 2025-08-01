import 'package:bela_blok/models/game_stats.dart';
import 'package:bela_blok/themes/app_theme.dart';
import 'package:flutter/material.dart';

class GameStatsWidget extends StatelessWidget {
  final GameStatsModel gameStats;

  const GameStatsWidget({
    super.key,
    required this.gameStats,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.4, 
        minHeight: 180,
      ),
      decoration: BoxDecoration(
        color: AppTheme.getCardBackgroundColor(context),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppTheme.getOverlayColor(context, opacity: 0),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: AppTheme.green.withValues(alpha: 1),
          width: 0.1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Row(
                children: [
                  Icon(Icons.analytics, color: AppTheme.green, size: 22),
                  SizedBox(width: 8),
                  Text(
                    'STATISTIKE IGRE',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.green,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.emoji_events, color: Colors.amber, size: 22),
                ],
              ),
              const Divider(),
              const SizedBox(height: 8),
              Row(
                children: [
                  // MI tim
                  Expanded(
                    child: _buildTeamStats(
                      context,
                      'MI',
                      Theme.of(context).colorScheme.primary,
                      gameStats.teamOneDeclarations,
                      gameStats.teamOneDeclarationsSum,
                      gameStats.teamOneFails,
                      isDark,
                    ),
                  ),
                  Container(
                    width: 2,
                    height: 110,
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.2),
                  ),
                  // VI tim
                  Expanded(
                    child: _buildTeamStats(
                      context,
                      'VI',
                      AppTheme.green,
                      gameStats.teamTwoDeclarations,
                      gameStats.teamTwoDeclarationsSum,
                      gameStats.teamTwoFails,
                      isDark,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTeamStats(
    BuildContext context,
    String teamLabel,
    Color color,
    int declarations,
    int declarationsSum,
    int fails,
    bool isDark,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          teamLabel,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 6),
        _buildStatRow('Broj zvanja', declarations, Icons.star, Colors.amber, isDark),
        _buildStatRow('Zbroj zvanja', declarationsSum, Icons.calculate, Colors.blue, isDark),
        _buildStatRow('Broj padova', fails, Icons.trending_down, Colors.red, isDark),
      ],
    );
  }

  Widget _buildStatRow(String label, int value, IconData icon, Color color, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Icon(icon, size: 15, color: color),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isDark ? Colors.grey[300] : Colors.grey[700],
              ),
            ),
          ),
          Text(
            value.toString(),
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
