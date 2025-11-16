import 'package:bela_blok/models/game_stats.dart';
import 'package:bela_blok/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'components_stats/stats_utils.dart';
import 'components_stats/team_column_widget.dart';
import 'components_stats/vertical_divider_widget.dart';
import 'components_stats/summary_row_widget.dart';
import 'package:bela_blok/models/game_stats_model.dart';

class GameStatsWidget extends StatefulWidget {
  final GameStats gameStats;

  const GameStatsWidget({
    super.key,
    required this.gameStats,
  });

  @override
  State<GameStatsWidget> createState() => _GameStatsWidgetState();
}

class _GameStatsWidgetState extends State<GameStatsWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  final statsColors = Theme.of(context).extension<GameStatsColors>();

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
        child: Column(
          children: [
            GestureDetector(
              onTap: () => setState(() => isExpanded = !isExpanded),
              child: Row(
                children: [
                  const Icon(Icons.analytics, color: AppTheme.green, size: 22),
                  const SizedBox(width: 8),
                  const Text(
                    'STATISTIKE IGRE',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.green,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.emoji_events,
                    color: statsColors?.declarations ?? Colors.amber,
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.expand_more,
                    color: AppTheme.green,
                    size: 24,
                  ),
                ],
              ),
            ),
            // Expandable content
            AnimatedCrossFade(
              firstChild: const SizedBox.shrink(),
              secondChild: _ExpandedStatsContent(
                gameStats: widget.gameStats,
                isDark: isDark,
              ),
              crossFadeState: isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 250),
            )
          ],
        ),
      ),
    );
  }
}

class _ExpandedStatsContent extends StatelessWidget {
  final GameStats gameStats;
  final bool isDark;

  const _ExpandedStatsContent({required this.gameStats, required this.isDark});

  @override
  Widget build(BuildContext context) {
  const double gap = 12;
  final calls1 = gameStats.teamOneCalls;
    final calls2 = gameStats.teamTwoCalls;
    final fails1 = gameStats.teamOneFails;
    final fails2 = gameStats.teamTwoFails;
    final dec1 = gameStats.teamOneDeclarations;
    final dec2 = gameStats.teamTwoDeclarations;
    final success1 = StatsUtils.calculateSuccessRate(calls1, fails1);
    final success2 = StatsUtils.calculateSuccessRate(calls2, fails2);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        children: [
          const Divider(),
         const  SizedBox(height: gap),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TeamColumnWidget(
                  label: 'MI',
                  labelColor: Theme.of(context).colorScheme.primary,
                  calls: calls1,
                  fails: fails1,
                  declarations: dec1,
                  isDark: isDark,
                ),
              ),
              const VerticalDividerWidget(),
              Expanded(
                child: TeamColumnWidget(
                  label: 'VI',
                  labelColor: AppTheme.green,
                  calls: calls2,
                  fails: fails2,
                  declarations: dec2,
                  isDark: isDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: gap),
          SummaryRowWidget(
            success1: success1,
            success2: success2,
            isDark: isDark,
          ),
        ],
      ),
    );
  }
}
