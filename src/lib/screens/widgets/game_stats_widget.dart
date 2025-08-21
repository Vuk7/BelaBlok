import 'package:bela_blok/themes/app_theme.dart';
import 'package:flutter/material.dart';

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
    final success1 = _calcSuccess(calls1, fails1);
    final success2 = _calcSuccess(calls2, fails2);

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
                child: _teamColumn(
                  context,
                  'MI',
                  Theme.of(context).colorScheme.primary,
                  calls1,
                  fails1,
                  dec1,
                ),
              ),
              _verticalDivider(context),
              Expanded(
                child: _teamColumn(
                  context,
                  'VI',
                  AppTheme.green,
                  calls2,
                  fails2,
                  dec2,
                ),
              ),
            ],
          ),
          const SizedBox(height: gap),
          _summaryRow(context, success1, success2),
        ],
      ),
    );
  }

  Widget _teamColumn(BuildContext context, String label, Color labelColor, int calls, int fails, int declarations) {
    final statsColors = Theme.of(context).extension<GameStatsColors>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: labelColor)),
        const SizedBox(height: 6),
        _statRow(Icons.phone_callback, 'Pozivi', calls.toString(), statsColors?.calls ?? Colors.blue, context),
        _statRow(Icons.trending_down, 'Padovi', fails.toString(), statsColors?.fails ?? Colors.red, context),
        _statRow(Icons.star, 'Zvanja', declarations.toString(), statsColors?.declarations ?? Colors.amber, context),
      ],
    );
  }

  Widget _statRow(IconData icon, String label, String value, Color color, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              style: TextStyle(fontSize: 12, color: isDark ? Colors.grey[300] : Colors.grey[700]),
            ),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget _verticalDivider(BuildContext context) => Container(
        width: 1,
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 12),
        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.15),
      );

  Widget _summaryRow(BuildContext context, int success1, int success2) {
    final statsColors = Theme.of(context).extension<GameStatsColors>();
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: statsColors?.successCard ?? (isDark ? Colors.grey[700] : Colors.grey[100]),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(child: _mini('Uspješnost MI', '$success1%')),
          Container(
            width: 1,
            height: 28,
            color: statsColors?.divider ?? Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.15),
            margin: const EdgeInsets.symmetric(horizontal: 12),
          ),
            Expanded(child: _mini('Uspješnost VI', '$success2%')),
        ],
      ),
    );
  }

  Widget _mini(String label, String value) => Column(
        children: [
          Text(
            value,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black87),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(fontSize: 10, color: isDark ? Colors.grey[400] : Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ],
      );

  static int _calcSuccess(dynamic calls, dynamic fails) {
    final c = (calls ?? 0) is int ? (calls ?? 0) : int.tryParse((calls ?? '0').toString()) ?? 0;
    final f = (fails ?? 0) is int ? (fails ?? 0) : int.tryParse((fails ?? '0').toString()) ?? 0;
    if (c == 0) return 0;
    return (((c - f) / c) * 100).round();
  }
}
