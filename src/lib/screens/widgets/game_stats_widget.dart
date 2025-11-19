
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
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  final statsColors = Theme.of(context).extension<GameStatsColors>();

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: double.infinity,
      constraints: BoxConstraints(
        maxHeight: isExpanded ? MediaQuery.of(context).size.height * 0.45 : 56, 
        minHeight: isExpanded ? 200 : 56,
      ),
      decoration: BoxDecoration(
        color: AppTheme.getCardBackgroundColor(context),
        borderRadius: BorderRadius.circular(16),
        boxShadow: isExpanded ? [
          BoxShadow(
            color: AppTheme.getOverlayColor(context, opacity: 0),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ] : null,
        border: isExpanded ? Border.all(
          color: AppTheme.green.withValues(alpha: 1),
          width: 0.1,
        ) : null,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () => setState(() => isExpanded = !isExpanded),
              child: Row(
                children: [
                  Icon(Icons.analytics, color: AppTheme.green, size: isExpanded ? 22 : 20),
                  const SizedBox(width: 8),
                  Text(
                    'STATISTIKE IGRE',
                    style: TextStyle(
                      fontSize: isExpanded ? 16 : 15,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.green,
                    ),
                  ),
                  const Spacer(),
                  if (isExpanded)
                    Icon(
                      Icons.emoji_events,
                      color: statsColors?.declarations ?? Colors.amber,
                      size: 24,
                    ),
                  if (isExpanded) const SizedBox(width: 8),
                  AnimatedRotation(
                    turns: isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      Icons.expand_more,
                      color: AppTheme.green,
                      size: isExpanded ? 24 : 22,
                    ),
                  ),
                ],
              ),
            ),
            // Expandable content
            if (isExpanded)
              Expanded(
                child: SingleChildScrollView(
                  child: AnimatedCrossFade(
                    firstChild: const SizedBox.shrink(),
                    secondChild: _ExpandedStatsContent(
                      gameStats: widget.gameStats,
                      isDark: isDark,
                    ),
                    crossFadeState: isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 250),
                  ),
                ),
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
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
