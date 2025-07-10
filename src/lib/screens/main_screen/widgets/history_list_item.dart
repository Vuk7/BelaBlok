import 'package:flutter/material.dart';

class HistoryListItem extends StatelessWidget {
  final String date;
  final int gameID, teamOneScore, teamTwoScore;
  final Function() onTap;

  const HistoryListItem({
    super.key,
    required this.gameID,
    required this.date,
    required this.teamOneScore,
    required this.teamTwoScore,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark 
          ? Colors.grey[700] 
          : Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(
              Icons.access_time,
              size: 18,
              color: Theme.of(context).brightness == Brightness.dark 
                ? Colors.white 
                : Colors.black,
            ),
            const SizedBox(width: 8),
            Text(
              date,
              style: TextStyle(
                fontSize: 15, 
                color: Theme.of(context).brightness == Brightness.dark 
                  ? Colors.white 
                  : Colors.black
              ),
            ),
            const Spacer(),
            Icon(
              Icons.emoji_events,
              size: 20,
              color: Theme.of(context).brightness == Brightness.dark 
                ? Colors.white 
                : Colors.black,
            ),
            const SizedBox(width: 8),
            Text(
              "$teamOneScore : $teamTwoScore",
              style: TextStyle(
                fontSize: 20, 
                color: Theme.of(context).brightness == Brightness.dark 
                  ? Colors.white 
                  : Colors.black
              ),
            ),
          ],
        ),
      ),
    );
  }
}
