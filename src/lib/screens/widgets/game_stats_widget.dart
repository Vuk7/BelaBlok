import 'package:bela_blok/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'components/stats_utils.dart';
import 'components/team_column_widget.dart';
import 'components/vertical_divider_widget.dart';
import 'components/summary_row_widget.dart';

class GameStatsWidget extends StatefulWidget {
  final Map<String, dynamic> gameStats;

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
      decoration: BoxDecoration(
        color: AppTheme.getCardBackgroundColor(context),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppTheme.getOverlayColor(context, opacity: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: AppTheme.green.withValues(alpha: 0.3),
          width: 2,
        ),
      ),
      child: Column(
        children: [
          // Header - uvijek vidljiv
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
                 const Icon(
                    Icons.analytics,
                    color: AppTheme.green,
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                 const Text(
                    'STATISTIKE IGRE',
                    style:  TextStyle(
                      fontSize: 18,
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
                  AnimatedRotation(
                    turns: isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: const Icon(
                      Icons.expand_more,
                      color: AppTheme.green,
                      size: 24,
                    ),
                  ),
                ],
              ),
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
    );
  }
}

class _ExpandedStatsContent extends StatelessWidget {
  final Map<String, dynamic> gameStats;
  final bool isDark;

  const _ExpandedStatsContent({required this.gameStats, required this.isDark});

  @override
  Widget build(BuildContext context) {
  const double gap = 12;
  final calls1 = gameStats['teamOneCalls'] ?? 0;
    final calls2 = gameStats['teamTwoCalls'] ?? 0;
    final fails1 = gameStats['teamOneFails'] ?? 0;
    final fails2 = gameStats['teamTwoFails'] ?? 0;
    final dec1 = gameStats['teamOneDeclarations'] ?? 0;
    final dec2 = gameStats['teamTwoDeclarations'] ?? 0;
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
