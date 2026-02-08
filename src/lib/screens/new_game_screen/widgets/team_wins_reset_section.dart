import 'package:bela_blok/themes/app_theme.dart';
import 'package:flutter/material.dart';

class TeamWinsResetSection extends StatefulWidget {
  final int teamOneWins, teamTwoWins;
  final Function() onTap;
  const TeamWinsResetSection({
    super.key,
    required this.teamOneWins,
    required this.teamTwoWins,
    required this.onTap,
  });

  @override
  State<TeamWinsResetSection> createState() => _TeamWinsResetSectionState();
}

class _TeamWinsResetSectionState extends State<TeamWinsResetSection> {
  double _turns = 0;

  void _handleTap() {
    setState(() => _turns++);
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.getCardBackgroundColor(context),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppTheme.getOverlayColor(context, opacity: 0),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'REZULTAT TIMOVA',
                style: AppTheme.sectionHeaderTextStyle.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const Spacer(),
              InkWell(
                borderRadius: BorderRadius.circular(999),
                onTap: _handleTap,
                child: AnimatedRotation(
                  turns: _turns,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                  child: const Icon(
                    Icons.refresh,
                    color: AppTheme.red,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${widget.teamOneWins}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              const Icon(
                Icons.emoji_events,
                size: 20,
                color: Colors.amber,
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                "${widget.teamTwoWins}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.orangeAccent,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
