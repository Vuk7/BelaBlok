import 'package:flutter/material.dart';

class HistoryListItem extends StatelessWidget {
  final String date, gameID;
  final int teamOneScore, teamTwoScore;
  final Function() onTap;
  final int teamOneWins, teamTwoWins;
  final bool finished;

  const HistoryListItem(
      {super.key,
      required this.gameID,
      required this.date,
      required this.teamOneScore,
      required this.teamTwoScore,
      required this.onTap,
      required this.teamOneWins,
      required this.teamTwoWins,
      required this.finished});

  @override
  Widget build(BuildContext context) {
    // Expecting date in "yyyy-MM-dd HH:mm" format
    final dateParts = date.split(' ');
    final dateOnly = dateParts.isNotEmpty ? dateParts[0] : '';
    final timeOnly = dateParts.length > 1 ? dateParts[1] : '';

    const miColor = Colors.blueAccent;
    const viColor = Colors.orangeAccent;
    final bgColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.grey[850]
        : Colors.white;
    final borderColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.blueGrey
        : Colors.grey[300];

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor ?? Colors.grey, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.black26
                : Colors.grey.withAlpha((0.08 * 255).toInt()),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Row(
          children: [
            // Date & time
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dateOnly,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  timeOnly,
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white70
                        : Colors.black54,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                Row(
                  children: finished == false
                      ? []
                      : [
                          Text(
                            "$teamOneWins",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: miColor,
                              fontSize: 13,
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
                            "$teamTwoWins",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: viColor,
                              fontSize: 13,
                            ),
                          ),
                        ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    // Score badges
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: miColor.withAlpha((0.15 * 255).toInt()),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Text(
                            "MI",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: miColor,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "$teamOneScore",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: miColor,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: viColor.withAlpha((0.15 * 255).toInt()),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "$teamTwoScore",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: viColor,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Text(
                            "VI",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: viColor,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
